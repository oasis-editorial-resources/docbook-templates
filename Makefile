# Version identifier used for identification of distributions - default to "dev-[timestamp]"
VERSION = $${PROJECT_VERSION:-dev-$$(date -u +%Y%m%d%H%M%Sz)}

# Default entry point
default: clean authoring publishing package

# Cleaning up project by deleting synlinks and target folder
clean: symlinks_clear
	@rm -rf target

# Creates target folder if not available
target_folder:
	@mkdir -p target

# Creating the initial version file to be built upon in the individual distributions
version_file: target_folder
	@echo "Version $(VERSION) of DocBook Templates and Stylesheets for OASIS work products." > target/VERSION.txt
	@echo "" >> target/VERSION.txt

# Preparing resources going into the authoring and viewing distributions
# Viewing distribution is the same as the authoring distribution except a few removed folders
authoring: version_file
	@rm -rf target/authoring target/viewing
	@rsync -a src/common/ target/authoring
	@rsync -a src/authoring/ target/authoring
	@cp LICENSE.md README.md target/VERSION.txt target/authoring/
	
	@cp -r target/authoring target/viewing
	@cd target/viewing && rm -rf documentation templates validation

	@echo "This is the edition prepared for authoring." >> target/authoring/VERSION.txt
	@cp target/authoring/VERSION.txt target/authoring/VERSION-authoring-$(VERSION).txt

	@echo "This is the edition prepared for viewing." >> target/viewing/VERSION.txt
	@cp target/viewing/VERSION.txt target/viewing/VERSION-viewing-$(VERSION).txt

# Preparing resources going into the publishing distribution
publishing: version_file
	@rm -rf target/publishing
	@rsync -a src/common/ target/publishing
	@rsync -a src/publishing/ target/publishing
	@cp LICENSE.md README.md target/VERSION.txt target/publishing/
	@cd target/publishing && rm -rf documentation templates validation
	@echo "This is the edition prepared for publishing." >> target/publishing/VERSION.txt
	@cp target/publishing/VERSION.txt target/publishing/VERSION-publishing-$(VERSION).txt

# Create all packages
package: authoring-package publishing-package

# Bundle authoring and publishing distributions into archives
authoring-package: authoring
	$(call tgz,target/authoring,../authoring-$(VERSION).tar.gz)
	$(call zip,target/authoring,../authoring-$(VERSION).zip)

	$(call tgz,target/viewing,../viewing-$(VERSION).tar.gz)
	$(call zip,target/viewing,../viewing-$(VERSION).zip)

# Bundle publishing distribution into archives
publishing-package: publishing
	$(call tgz,target/publishing,../publishing-$(VERSION).tar.gz)
	$(call zip,target/publishing,../publishing-$(VERSION).zip)

# Create convenient symlinks in the common folder for easier development
symlinks: symlinks_clear
	@test -e src/common/docbook || (cd src/common && ln -s ../publishing/docbook docbook)
	@test -e src/common/templates || (cd src/common && ln -s ../authoring/templates templates)

# Remove symlinks if found
symlinks_clear:
	@test ! -e src/common/docbook || rm src/common/docbook
	@test ! -e src/common/templates || rm src/common/templates


# Functions

# Create tar.gz file from folder
# Usage: $(call tgz, [folder], [tar.gz file relative to folder])
define tgz
	@rm -f $(2)
	@cd $(1) && tar -czf $(2) *
endef

# Create zip file from folder
# Usage: $(call zip, [folder], [zip file relative to folder])
define zip
	@rm -f $(2)
	@cd $(1) && zip -q9r $(2) *
endef
