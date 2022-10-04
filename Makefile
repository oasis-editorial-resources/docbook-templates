default: clean authoring publishing package

clean:
	@rm -rf target

authoring:
	@mkdir -p target
	@rsync -a src/common/ target/authoring
	@rsync -a src/authoring/ target/authoring

publishing:
	@mkdir -p target
	@rsync -a src/common/ target/publishing
	@rsync -a src/publishing/ target/publishing

package:
	@cd target/authoring && tar -czf ../authoring.tar.gz *
	@cd target/authoring && zip -q9r ../authoring.zip *

	@cd target/publishing && tar -czf ../publishing.tar.gz *
	@cd target/publishing && zip -q9r ../publishing.zip *


local:
	@cd src/common && ln -s ../publishing/docbook docbook