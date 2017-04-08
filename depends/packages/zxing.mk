package=zxing
$(package)_version=0.0.1
$(package)_download_path=https://github.com/glassechidna/zxing-cpp/archive
$(package)_file_name=master.tar.gz
$(package)_sha256_hash=40590413b63cee3147d7fbdcc007b577140c319e3790f04ffe370d02326b08e5

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

