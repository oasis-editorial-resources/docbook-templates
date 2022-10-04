default: clean authoring publishing

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

local:
	@cd src/common && ln -s ../publishing/docbook docbook