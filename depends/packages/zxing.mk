package=zxing
$(package)_version=0.0.1
$(package)_download_path=https://github.com/glassechidna/zxing-cpp/archive
$(package)_file_name=master.zip
$(package)_sha256_hash=c479d714b0433439878f6be4d7d764e2809f1c261bbbe659b281c4aee2183caf

define $(package)_config_cmds
  mkdir -p build &&\
  cd build &&\
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$(host_prefix) ..
endef

define $(package)_build_cmds
 cd $($(package)_extract_dir)/build && $(MAKE)
endef

define $(package)_stage_cmds
  cd $($(package)_extract_dir)/build && $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef

