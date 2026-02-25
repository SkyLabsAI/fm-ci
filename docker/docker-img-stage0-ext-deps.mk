.PHONY: fm-$(BR_FMDEPS_VERSION)-ext-deps
fm-$(BR_FMDEPS_VERSION)-ext-deps: fm-$(BR_FMDEPS_VERSION)-os Dockerfile-ext-deps files/_skylabs-deps.opam
	@echo "[DOCKER] Building $@"
	$(Q)docker buildx build \
		--platform linux/amd64 \
		-t $(DOCKER_REPO):$@ \
		$(call docker_opts,ext-deps,$@) \
		--build-arg BASE_IMAGE=$(DOCKER_REPO):$< \
		-f Dockerfile-ext-deps .

DOCKER_BUILD_TARGETS += fm-$(BR_FMDEPS_VERSION)-ext-deps
DOCKER_PUSH_TARGETS += push-fm-$(BR_FMDEPS_VERSION)-ext-deps

GEN_FILES += files/_skylabs-deps.opam
files/_skylabs-deps.opam: ../../../dev/opam-deps/skylabs-deps.opam
	$(Q)cp $< $@

.PHONY: fm-ext-deps
fm-ext-deps: fm-$(BR_FMDEPS_VERSION)-ext-deps
	$(call tag-target,$<,$@)

DOCKER_BUILD_TARGETS += fm-ext-deps

ifeq ($(TAG_DEFAULTS),yes)
DOCKER_PUSH_TARGETS += push-fm-ext-deps
endif
