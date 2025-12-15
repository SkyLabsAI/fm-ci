.PHONY: fm-$(BR_FMDEPS_VERSION)-stage3-release
fm-$(BR_FMDEPS_VERSION)-stage3-release: fm-$(BR_FMDEPS_VERSION)-stage2-llvm-$(LLVM_MAIN_VERSION) prepare-fm-release
	$(call opam-img-target,\
	grep -E "(rocq-skylabs-cpp2v|rocq-skylabs-cpp-stdlib|rocq-brick-libstdcpp|rocq-skylabs-scaffold)")

DOCKER_BUILD_TARGETS += fm-$(BR_FMDEPS_VERSION)-stage3-release
DOCKER_PUSH_TARGETS += push-fm-$(BR_FMDEPS_VERSION)-stage3-release
