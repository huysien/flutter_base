.PHONY: setup
setup:
	$(MAKE) gen

.PHONY: gen
gen:
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	fvm flutter pub run build_runner watch

.PHONY: validate
validate:
	$(MAKE) gen
	fvm dart format --output=none --set-exit-if-changed .
	fvm flutter analyze --fatal-infos
	fvm flutter test

.PHONY: screen
screen:
	mason make screen
	fvm flutter pub run build_runner build --delete-conflicting-outputs
