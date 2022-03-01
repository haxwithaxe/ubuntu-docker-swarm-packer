
source "qemu" "ubuntu" {
	disk_compression = true
	disk_image = true
	disk_size = "5G"
	cpus = 1
	memory = 2048
	format = "qcow2"
	iso_url = "build/ubuntu-20.04-server-cloudimg-amd64.img"
	iso_checksum = "sha256:3d7282d3e92bd2547db9d26590f4a951cead31a10a6470b18ef0848f83db2051"
	headless = true
	output_directory = "build/image"
	qemuargs = [
		#["-m", "2048M"],
		#["-smp", "2"],
		["-fda", "build/cloud.img"],
		["-serial", "mon:stdio"]
	]
	ssh_port = 22
	ssh_timeout = "300s"
	ssh_username = "ubuntu"
	ssh_password = "ubuntu"
	use_default_display = true
	vm_name = "ubuntu-20.04-server-cloudimg-amd64-docker-base.qcow2"
}

build {
	sources = ["source.qemu.ubuntu"]
	provisioner "file" {
		source = "install-tools.sh"
		destination = "install-tools.sh"
	}
	provisioner "file" {
		source = "install-docker.sh"
		destination = "install-docker.sh"
	}
	provisioner "file" {
		source = "cleanup.sh"
		destination = "cleanup.sh"
	}
	provisioner "shell" {
		inline = [
			"sudo bash install-tools.sh",
			"sudo bash install-docker.sh",
			"sudo bash cleanup.sh"
		]
	}
}
