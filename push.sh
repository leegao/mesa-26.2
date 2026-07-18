push() {
	adb push $1 /data/local/tmp/
	adb shell run-as com.ludashi.benchmark "cp /data/local/tmp/$1 files/imagefs/usr/lib/$1"
	adb shell run-as com.ludashi.benchmark "ls -lh files/imagefs/usr/lib/$1"
}

push_vvl() {
	adb push $1 /data/local/tmp/
	adb shell run-as com.ludashi.benchmark "cp /data/local/tmp/$1 files/imagefs/usr/share/vulkan/explicit_layer.d/$1"
	adb shell run-as com.ludashi.benchmark "ls -lh files/imagefs/usr/share/vulkan/explicit_layer.d/$1"
}

meson compile -C build
cd build/src/panfrost/vulkan/
push libvulkan_panfrost.so
cd -
