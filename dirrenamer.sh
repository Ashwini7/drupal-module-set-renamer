#!/bin/bash

PARENT_DIR=$1
OLD_NAME=$2
NEW_NAME=$3
NEW_SITE_NAME=$4

NEW_PARENT_DIR=drupal-site-jnl-$PARENT_DIR

mv $PARENT_DIR $NEW_PARENT_DIR

OLD_CHILD_MODULES=$(ls $NEW_PARENT_DIR/modules)
OLD_CHILD_PROFILES=$(ls $NEW_PARENT_DIR/profiles)



for old_child_module in $OLD_CHILD_MODULES; do
	#echo $old_child_dir

	#Figure out new directory name
	NEW_CHILD_MODULE=${old_child_module//$OLD_NAME/$NEW_NAME}

	#echo $NEW_CHILD_DIR

	#Move old child dir to new child dir
	echo "Now moving $old_child_module -> $NEW_CHILD_MODULE"
	cd $NEW_PARENT_DIR/modules
	mv $old_child_module $NEW_CHILD_MODULE
	sed "s/^name =.*/name = $NEW_SITE_NAME/g" $NEW_CHILD_MODULE/$NEW_CHILD_MODULE.info > $NEW_CHILD_MODULE/$NEW_CHILD_MODULE.info.tmp && mv $NEW_CHILD_MODULE/$NEW_CHILD_MODULE.info.tmp $NEW_CHILD_MODULE/$NEW_CHILD_MODULE.info
	echo ""
	cd ../../
done

ls -la $NEW_PARENT_DIR/modules

for old_child_profile in $OLD_CHILD_PROFILES; do
	#echo $old_child_dir

	#Figure out new directory name
	NEW_CHILD_PROFILE=${old_child_profile//$OLD_NAME/$NEW_NAME}

	#echo $NEW_CHILD_DIR

	#Move old child dir to new child dir
	echo "Now moving $old_child_profile -> $NEW_CHILD_PROFILE"
	cd $NEW_PARENT_DIR/profiles
	mv $old_child_profile $NEW_CHILD_PROFILE
	sed "s/^name =.*/name = $NEW_SITE_NAME/g" $NEW_CHILD_PROFILE/$NEW_CHILD_PROFILE.info > $NEW_CHILD_PROFILE/$NEW_CHILD_PROFILE.info.tmp && mv $NEW_CHILD_PROFILE/$NEW_CHILD_PROFILE.info.tmp $NEW_CHILD_PROFILE/$NEW_CHILD_PROFILE.info
	echo ""
	cd ../../
done

ls -la $NEW_PARENT_DIR/profiles
