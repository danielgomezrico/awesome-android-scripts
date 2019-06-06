#
# Filter some items based on the current day of the week and send to firebase to run tests on them.
# Check https://firebase.google.com/docs/test-lab/command-line
#

import commands
from datetime import date
import random

class Device:
    def __init__(self, model_id, model_name, android_versions):
        self.model_id = model_id.strip()
        self.model_name = model_name.strip()
        self.android_versions = android_versions.strip().split(",")

def read_devices(count):
	left_index_limit = (date.today().isocalendar()[2] * count) - count + 7 # devices info starts on 7 on output
	list_models_command = "gcloud firebase test android models list"
	full_output = commands.getstatusoutput(list_models_command)[1]
	split_data = full_output.split("\n")

	found_devices = []

	print("--> Output from firebase:")
	print(full_output)

	right_index_limit = left_index_limit + count
	if (right_index_limit >= len(split_data) - 1):
		right_index_limit = len(split_data) - 1

	for i in range(left_index_limit, right_index_limit):
		split_device = split_data[i].split("|")
		device = Device(split_device[1], split_device[2], split_device[6])
		found_devices.append(device)

	print("\n--> Selected found_devices \n")
	for d in found_devices:
		print("----->  {0}, {1}, {2}".format(d.model_id, d.model_name, d.android_versions))

	return found_devices

def build_firebase_test_command(devices):
	apk_path="app/build/outputs/apk"
	run_tests_command = "gcloud firebase test android run --type instrumentation --use-orchestrator --app {0}/debug/app-debug.apk --test {0}/androidTest/debug/app-debug-androidTest.apk \\".format(apk_path)

	for device in devices:
		android_version = random.choice(device.android_versions)
		run_tests_command += "\n--device model={0},version={1},locale=en,orientation=portrait \\".format(device.model_id, android_version)

	return run_tests_command[:-1] # to remove '\' on the last item

def run_command(command):
	print("\n--> Running: \n'${0}'".format(command))
	output = commands.getstatusoutput(command)
	print(output[1])


run_command("gcloud config set project <project-id-on-firebase>")
devices = read_devices(8)
runTestsCommand = build_firebase_test_command(devices)

# Run connectedCheck to build the required apks, dont worry if no devices are connected for this
run_command("./gradlew app:assembleDebug  -PenableAnalytics")
run_command("./gradlew app:assembleAndroidTest  -PenableAnalytics")
run_command(runTestsCommand)