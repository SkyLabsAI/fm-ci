.PHONY: fm-$(BR_FMDEPS_VERSION)-stage3-release
fm-$(BR_FMDEPS_VERSION)-stage3-release: fm-$(BR_FMDEPS_VERSION)-stage2-llvm-$(LLVM_MAIN_VERSION) prepare-fm-release
	$(call opam-img-target,\
	grep -E "(rocq-skylabs-cpp2v|rocq-skylabs-scaffold)")

# We exclude `rocq-skylabs-cpp-stdlib|rocq-brick-libstdcpp`: they shouldn't be
# installed when developing the stdlib.
# See https://github.com/SkyLabsAI/skylabs-fm/issues/134

DOCKER_BUILD_TARGETS += fm-$(BR_FMDEPS_VERSION)-stage3-release
DOCKER_PUSH_TARGETS += push-fm-$(BR_FMDEPS_VERSION)-stage3-release
