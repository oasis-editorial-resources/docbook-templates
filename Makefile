default: clean authoring publishing

clean:
	@rm -rf target

authoring:
	@mkdir -p target
	@rsync -a src/common/ target/authoring
	@rsync -a src/authoring/ target/authoring
	@cd target/authoring && tar -cf ../authoring.tar *
	@gzip -9 target/authoring.tar

publishing:
	@mkdir -p target
	@rsync -a src/common/ target/publishing
	@rsync -a src/publishing/ target/publishing
	@cd target/publishing && tar -cf ../publishing.tar *
	@gzip -9 target/publishing.tar

local:
	@cd src/common && ln -s ../publishing/docbook docbook