VERSION = $${PROJECT_VERSION:-dev-$$(date -u +%Y%m%d%H%M%Sz)}

default: clean authoring publishing package

clean:
	@rm -rf target
	@test ! -e src/common/docbook || rm src/common/docbook
	@test ! -e src/common/templates || rm src/common/templates

target/VERSION.txt:
	@mkdir -p target
	@echo "Version $(VERSION) of DocBook Templates and Stylesheets for OASIS work products." > target/VERSION.txt
	@echo "" >> target/VERSION.txt

authoring: target/VERSION.txt
	@rsync -a src/common/ target/authoring
	@rsync -a src/authoring/ target/authoring
	@cp LICENSE.md README.md target/VERSION.txt target/authoring/
	@echo "This is the edition prepared for authoring." >> target/authoring/VERSION.txt
	@cp target/authoring/VERSION.txt target/authoring/VERSION-authoring-$(VERSION).txt

publishing: target/VERSION.txt
	@rsync -a src/common/ target/publishing
	@rsync -a src/publishing/ target/publishing
	@cp LICENSE.md README.md target/VERSION.txt target/publishing/
	@echo "This is the edition prepared for publishing." >> target/publishing/VERSION.txt
	@cp target/publishing/VERSION.txt target/publishing/VERSION-publishing-$(VERSION).txt

package:
	@cd target/authoring && tar -czf ../authoring-$(VERSION).tar.gz *
	@cd target/authoring && zip -q9r ../authoring-$(VERSION).zip *

	@cd target/publishing && tar -czf ../publishing-$(VERSION).tar.gz *
	@cd target/publishing && zip -q9r ../publishing-$(VERSION).zip *

symlinks:
	@test -e src/common/docbook || (cd src/common && ln -s ../publishing/docbook docbook)
	@test -e src/common/templates || (cd src/common && ln -s ../authoring/templates templates)