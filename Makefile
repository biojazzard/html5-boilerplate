# by Alfredo Llanos
VERSION=1.4.0
DATE=$(shell date)
# BOOTSTRAP
BOOTSTRAP = ./css/bootstrap.css
BOOTSTRAP_MIN = ./css/bootstrap.min.css
BOOTSTRAP_LESS = ./lib/less/bootstrap.less
# STYLECSS
STYLECSS = ./css/style.css
STYLECSS_MIN = ./css/style.min.css
STYLECSS_LESS = ./lib/less/style.less
# CONFIG
LESS_COMPRESSOR ?= `which lessc`
UGLIFY_JS ?= `which uglifyjs`
WATCHR ?= `which watchr`

build:
	@@if test ! -z ${LESS_COMPRESSOR}; then \
		sed -e 's/@VERSION/'"v${VERSION}"'/' -e 's/@DATE/'"${DATE}"'/' <${BOOTSTRAP_LESS} >${BOOTSTRAP_LESS}.tmp; \
		lessc ${BOOTSTRAP_LESS}.tmp > ${BOOTSTRAP}; \
		lessc ${BOOTSTRAP_LESS}.tmp > ${BOOTSTRAP_MIN} --compress; \
		rm -f ${BOOTSTRAP_LESS}.tmp; \
		sed -e 's/@VERSION/'"v${VERSION}"'/' -e 's/@DATE/'"${DATE}"'/' <${STYLECSS_LESS} >${STYLECSS_LESS}.tmp; \
		lessc ${STYLECSS_LESS}.tmp > ${STYLECSS}; \
		lessc ${STYLECSS_LESS}.tmp > ${STYLECSS_MIN} --compress; \
		rm -f ${STYLECSS_LESS}.tmp; \
		echo "StyleSheet & BootStrap successfully built! - `date`"; \
	else \
		echo "You must have the LESS compiler installed in order to build Bootstrap."; \
		echo "You can install it by running: npm install less -g"; \
	fi

jsmin:
	@@if test ! -z ${UGLIFY_JS}; then \
		mkdir -p js/min; \
		uglifyjs -o js/min/plugins.min.js				lib/js/plugins.js;\
		uglifyjs -o js/min/script.min.js				lib/js/script.js;\
		uglifyjs -o js/min/bootstrap-alerts.min.js		lib/js/bootstrap-alerts.js;\
		uglifyjs -o js/min/bootstrap-buttons.min.js		lib/js/bootstrap-buttons.js;\
		uglifyjs -o js/min/bootstrap-dropdown.min.js	lib/js/bootstrap-dropdown.js;\
		uglifyjs -o js/min/bootstrap-modal.min.js		lib/js/bootstrap-modal.js;\
		uglifyjs -o js/min/bootstrap-popover.min.js		lib/js/bootstrap-popover.js;\
		uglifyjs -o js/min/bootstrap-scrollspy.min.js	lib/js/bootstrap-scrollspy.js;\
		uglifyjs -o js/min/bootstrap-tabs.min.js		lib/js/bootstrap-tabs.js;\
		uglifyjs -o js/min/bootstrap-twipsy.min.js		lib/js/bootstrap-twipsy.js;\
		echo "js successfully Minified! - `date`"; \
	else \
		echo "You must have the UGLIFYJS minifier installed in order to minify Bootstrap's js."; \
		echo "You can install it by running: npm install uglify-js -g"; \
	fi

watch:
	@@if test ! -z ${WATCHR}; then \
	  echo "Watching less files..."; \
	  watchr -e "watch('lib/less/.*\.less') { system 'make' }"; \
	else \
		echo "You must have the watchr installed in order to watch Bootstrap less files."; \
		echo "You can install it by running: gem install watchr"; \
	fi

.PHONY: build watch
