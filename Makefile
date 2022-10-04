VERSION = $${PROJECT_VERSION:-dev-$$(date -u +%Y%m%d%H%M%Sz)}

default: clean authoring publishing package

clean:
	@rm -rf target

authoring:
	@mkdir -p target
	@rsync -a src/common/ target/authoring
	@rsync -a src/authoring/ target/authoring
	@cp LICENSE.md README.md target/authoring/

publishing:
	@mkdir -p target
	@rsync -a src/common/ target/publishing
	@rsync -a src/publishing/ target/publishing
	@cp LICENSE.md README.md target/publishing/

package:
	@cd target/authoring && tar -czf ../authoring-$(VERSION).tar.gz *
	@cd target/authoring && zip -q9r ../authoring-$(VERSION).zip *

	@cd target/publishing && tar -czf ../publishing-$(VERSION).tar.gz *
	@cd target/publishing && zip -q9r ../publishing-$(VERSION).zip *

symlinks:
	@test -e src/common/docbook || (cd src/common && ln -s ../publishing/docbook docbook)
	@test -e src/common/templates || (cd src/common && ln -s ../authoring/templates templates)