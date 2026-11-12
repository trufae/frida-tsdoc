TYPES_REPO := https://github.com/DefinitelyTyped/DefinitelyTyped.git
TYPES_DIR := .deps/DefinitelyTyped
TYPEDOC := node_modules/.bin/typedoc

.PHONY: all pull deps docs zip clean

all: docs

# Frida Gum's TypeScript declarations are maintained in DefinitelyTyped.
pull:
	@if [ -e "$(TYPES_DIR)/.git" ]; then \
		git -C "$(TYPES_DIR)" pull --ff-only; \
	else \
		mkdir -p .deps && \
		git clone --depth 1 --filter=blob:none --sparse "$(TYPES_REPO)" "$(TYPES_DIR)"; \
	fi
	git -C "$(TYPES_DIR)" sparse-checkout set types/frida-gum

deps: $(TYPEDOC)

$(TYPEDOC):
	npm install --no-save --package-lock=false typedoc typescript

docs: pull deps
	$(TYPEDOC) --tsconfig tsconfig.docs.json --name "Frida Gum" \
		--readme none --out docs "$(TYPES_DIR)/types/frida-gum/index.d.ts"

zip: docs
	rm -f frida-gum-docs.zip
	zip -qr frida-gum-docs.zip docs

clean:
	rm -rf docs frida-gum-docs.zip
