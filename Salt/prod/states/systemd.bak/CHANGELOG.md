# Changelog

## [0.21.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.21.0...v0.21.1) (2022-02-12)


### Bug Fixes

* **package:** remove nss-resolve package, and set resolve target ([207ae7f](https://github.com/saltstack-formulas/systemd-formula/commit/207ae7f678a9ade9f95d60edce58725f6ad39622))


### Continuous Integration

* **gemfile:** allow rubygems proxy to be provided as an env var [skip ci] ([578fcd4](https://github.com/saltstack-formulas/systemd-formula/commit/578fcd48011712df265e585771886c5c357ff19f))
* **kitchen+ci:** update with `3004` pre-salted images/boxes [skip ci] ([afa6a36](https://github.com/saltstack-formulas/systemd-formula/commit/afa6a36fb84bdd36009f932e3d281796923e494e))
* **kitchen+gitlab:** update for new pre-salted images [skip ci] ([c6c172d](https://github.com/saltstack-formulas/systemd-formula/commit/c6c172db02aa162d474ab35cc68ee4a6e73cfc23))

# [0.21.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.20.0...v0.21.0) (2021-10-09)


### Bug Fixes

* **rsync_test_package:** use correct package for Gentoo ([b787713](https://github.com/saltstack-formulas/systemd-formula/commit/b787713805d4a7c9f9efdd0e3de6123f2b3cd534))


### Continuous Integration

* **gitlab-ci:** enable all `master` platforms except `oraclelinux-7` ([ad867bb](https://github.com/saltstack-formulas/systemd-formula/commit/ad867bb701f43c63ca6ee49525d4b47dc28cd4c0))


### Features

* **os*map.yaml:** restructure across all platforms ([10a6c24](https://github.com/saltstack-formulas/systemd-formula/commit/10a6c241d38c040825c3b6b22c7223ebe9a50041))
* **wait_online:** use separate `enabled` & `running` states ([a42fa97](https://github.com/saltstack-formulas/systemd-formula/commit/a42fa9711b1be4e6594a3819b206bcdeeacdc297))

# [0.20.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.19.1...v0.20.0) (2021-10-08)


### Continuous Integration

* **3003.1:** update inc. AlmaLinux, Rocky & `rst-lint` [skip ci] ([73c1b61](https://github.com/saltstack-formulas/systemd-formula/commit/73c1b610f3dd430bd634febc8296b6a654967d6e))
* **gemfile+lock:** use `ssf` customised `inspec` repo [skip ci] ([b9fc05c](https://github.com/saltstack-formulas/systemd-formula/commit/b9fc05c03322e4ec4f9c91ed67e999be2052eaf4))
* **kitchen:** move `provisioner` block & update `run_command` [skip ci] ([04bb311](https://github.com/saltstack-formulas/systemd-formula/commit/04bb311059785da05001d80aac577a9cbfcd30be))
* **kitchen+ci:** update with latest `3003.2` pre-salted images [skip ci] ([69f215f](https://github.com/saltstack-formulas/systemd-formula/commit/69f215f0b8b11b576b6760e00a19783e48e7d814))
* **kitchen+ci:** update with latest CVE pre-salted images [skip ci] ([a745088](https://github.com/saltstack-formulas/systemd-formula/commit/a74508838fc4158c501e2092600fd475963efafd))
* add Debian 11 Bullseye & update `yamllint` configuration [skip ci] ([9e958b0](https://github.com/saltstack-formulas/systemd-formula/commit/9e958b0aed9fac78b7a6eaede726411d80fdf32f))


### Features

* **centos-stream:** add Centos Stream support ([cdddd55](https://github.com/saltstack-formulas/systemd-formula/commit/cdddd55e4921d0e2a1d1cf3afaf4211ca8cae927))
* **osfingermap:** add Debian 11 support (w/o `wait_online`) [skip ci] ([d24fd3f](https://github.com/saltstack-formulas/systemd-formula/commit/d24fd3f606e8de56af1a445e2685236c3cce57b3))

## [0.19.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.19.0...v0.19.1) (2021-06-23)


### Bug Fixes

* **units:** start `path` units as well as `service` units ([99b4863](https://github.com/saltstack-formulas/systemd-formula/commit/99b48639b3750a26c7c55d4f249bef6d65521ba5))


### Continuous Integration

* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] ([9034dae](https://github.com/saltstack-formulas/systemd-formula/commit/9034daed4520c58f67b10c544a93857f841eebaf))
* add `arch-master` to matrix and update `.travis.yml` [skip ci] ([c2c7e8b](https://github.com/saltstack-formulas/systemd-formula/commit/c2c7e8b72e3d5ddc885504bd774db74b46533be4))

# [0.19.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.18.0...v0.19.0) (2021-04-26)


### Bug Fixes

* **fedora:** ensure `networkd` package installed for Fedora 34 [skip ci] ([a93cd95](https://github.com/saltstack-formulas/systemd-formula/commit/a93cd956da7822c2c70a1e90d56ffe4c4510c08c))
* **networkd:** use networkctl to reload config changes ([f4be1ed](https://github.com/saltstack-formulas/systemd-formula/commit/f4be1ed291048cb60e1162844fe05618072aabbf))


### Code Refactoring

* **networkd/template:** remove empty lines with spaces ([6fb14d5](https://github.com/saltstack-formulas/systemd-formula/commit/6fb14d5815d57d47293440d1b757c2783c624a29))


### Continuous Integration

* **kitchen+gitlab:** adjust matrix to add `3003` [skip ci] ([d77297e](https://github.com/saltstack-formulas/systemd-formula/commit/d77297e87be905ebb8ff592fb4f25402f9cc8689))


### Features

* **networkd:** allow configuration of file attributes ([34dd64b](https://github.com/saltstack-formulas/systemd-formula/commit/34dd64b6a0baf451a06a97168b68d269ef3ff396))

# [0.18.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.17.0...v0.18.0) (2021-04-02)


### Bug Fixes

* **fedora:** ensure `networkd` package is installed for Fedora 33 ([54be05c](https://github.com/saltstack-formulas/systemd-formula/commit/54be05c83309875fcad39daff7317ae3d5b15b8a))


### Continuous Integration

* **commitlint:** ensure `upstream/master` uses main repo URL [skip ci] ([0990fd6](https://github.com/saltstack-formulas/systemd-formula/commit/0990fd63b6a0712c025d01ea6a9e1b620e27a830))
* **gemfile+lock:** use `ssf` customised `kitchen-docker` repo [skip ci] ([f433c36](https://github.com/saltstack-formulas/systemd-formula/commit/f433c369ee50fffaea4e9231d70a71b433599439))
* **gitlab-ci:** add `rubocop` linter (with `allow_failure`) [skip ci] ([f501d91](https://github.com/saltstack-formulas/systemd-formula/commit/f501d91a1b7ba2dfba5082cbdb54d1f0528070a6))
* **gitlab-ci:** use GitLab CI as Travis CI replacement ([2ea7839](https://github.com/saltstack-formulas/systemd-formula/commit/2ea7839a94d530587e6d533bf4be398195783265))
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] ([0205d11](https://github.com/saltstack-formulas/systemd-formula/commit/0205d118dbabc387dd7b2e5cad6f4d8985aba749))
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] ([3b80bae](https://github.com/saltstack-formulas/systemd-formula/commit/3b80bae4c96006b06d65f2e060370198f923db6e))
* **kitchen+travis:** use `tiamat` pre-salted images [skip ci] ([580d3b9](https://github.com/saltstack-formulas/systemd-formula/commit/580d3b92958f161150d30a2afaad0ad87bed17f9))
* **pre-commit:** add to formula [skip ci] ([997a1f1](https://github.com/saltstack-formulas/systemd-formula/commit/997a1f12c7763a3a1899d8499ab093dd0a0b4085))
* **pre-commit:** enable/disable `rstcheck` as relevant [skip ci] ([cdc702a](https://github.com/saltstack-formulas/systemd-formula/commit/cdc702af5c1f9582a119ea5705bc7300074cc7f9))
* **pre-commit:** finalise `rstcheck` configuration [skip ci] ([389b253](https://github.com/saltstack-formulas/systemd-formula/commit/389b253df6550b7be33d512429f7144b9fa5f3c9))
* **pre-commit:** update hook for `rubocop` [skip ci] ([bc5d74e](https://github.com/saltstack-formulas/systemd-formula/commit/bc5d74ebe06a735852489124113f54ec7f256a6f))


### Features

* **unit:** add dropin capability for unit files ([3d8abee](https://github.com/saltstack-formulas/systemd-formula/commit/3d8abeeda011ffcde92b946e5599ea5201395ead))


### Tests

* standardise use of `share` suite & `_mapdata` state [skip ci] ([c815870](https://github.com/saltstack-formulas/systemd-formula/commit/c815870d1ad2a244c9c9148ed52f67ef86bb38c6))

# [0.17.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.16.0...v0.17.0) (2020-09-19)


### Bug Fixes

* **resolved:** add missing header in config file ([ffa0d89](https://github.com/saltstack-formulas/systemd-formula/commit/ffa0d8957d9dc162545fdbcc7accdeca29283dc0))


### Continuous Integration

* **kitchen:** use `saltimages` Docker Hub where available [skip ci] ([5f1e3e8](https://github.com/saltstack-formulas/systemd-formula/commit/5f1e3e89260e1852c93f566e91a2b4f4a7a2d517))


### Features

* **journald:** add service management ([32d2e70](https://github.com/saltstack-formulas/systemd-formula/commit/32d2e70d21a2a99cc0c5455601d478db0e00cda5))


### Styles

* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] ([d633daf](https://github.com/saltstack-formulas/systemd-formula/commit/d633daffc6565332a9e4b24231f25a75356609b9))

# [0.16.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.15.0...v0.16.0) (2020-06-01)


### Continuous Integration

* **kitchen+travis:** use latest pre-salted images ([a531d38](https://github.com/saltstack-formulas/systemd-formula/commit/a531d38464eadef87802fa5a76ec5bfdad6199bd))


### Features

* **python3:** update for `ubuntu-20.04` & `fedora-32` ([7e719e0](https://github.com/saltstack-formulas/systemd-formula/commit/7e719e0637700e99d3e85d888390ea10cc93dd6b))

# [0.15.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.14.2...v0.15.0) (2020-05-25)


### Continuous Integration

* **gemfile.lock:** add to repo with updated `Gemfile` [skip ci] ([ff5d8b8](https://github.com/saltstack-formulas/systemd-formula/commit/ff5d8b897f5c4cdcb30f1f2a3f8e1b516360825a))
* **kitchen+travis:** remove `master-py2-arch-base-latest` [skip ci] ([e75b92c](https://github.com/saltstack-formulas/systemd-formula/commit/e75b92c033242c69564719c803ffbdce54aa3b75))
* **travis:** add notifications => zulip [skip ci] ([92827e9](https://github.com/saltstack-formulas/systemd-formula/commit/92827e9e3ee0f3a3a0d6620f7bb517b69609c3b8))
* **workflows/commitlint:** add to repo [skip ci] ([dbdb414](https://github.com/saltstack-formulas/systemd-formula/commit/dbdb4147def0b8934e09ebc5e74b767a04db8cf9))


### Features

* **unit:** allow to start/stop, enable/disable services ([5f7d854](https://github.com/saltstack-formulas/systemd-formula/commit/5f7d854f76f964fdaea6a5f56960343b48c72310))

## [0.14.2](https://github.com/saltstack-formulas/systemd-formula/compare/v0.14.1...v0.14.2) (2020-04-18)


### Bug Fixes

* **centos-8:** fix systemd-networkd package installation ([f2025e3](https://github.com/saltstack-formulas/systemd-formula/commit/f2025e32a585ceb6a635ac92f66a3511cd167d34))

## [0.14.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.14.0...v0.14.1) (2020-03-30)


### Bug Fixes

* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] ([6dadf5d](https://github.com/saltstack-formulas/systemd-formula/commit/6dadf5dce2c1ef85b46cb812ef7bb2f12772cdb1))
* **release.config.js:** use full commit hash in commit link [skip ci] ([bfad0ce](https://github.com/saltstack-formulas/systemd-formula/commit/bfad0ce6cee76e78818f25811e2e3162339cbdde))


### Continuous Integration

* **kitchen:** reinstall `udev` since removed from pre-salted images ([1e99a6f](https://github.com/saltstack-formulas/systemd-formula/commit/1e99a6f6864ff7bdf3853356d6352fd269b448fc))
* workaround issues with newly introduced `amazonlinux-1` [skip ci] ([a7fe651](https://github.com/saltstack-formulas/systemd-formula/commit/a7fe6515d043490a37d1f92125060392586d8013))
* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([abb7c16](https://github.com/saltstack-formulas/systemd-formula/commit/abb7c16ec3b2d61ea3eb1c799f04acb018aebf3a))
* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([6c4e811](https://github.com/saltstack-formulas/systemd-formula/commit/6c4e81151f6cf1bb0638714038c6a772bfc7e9c2))
* **kitchen:** use `debian-10-master-py3` instead of `develop` [skip ci] ([baaf5b3](https://github.com/saltstack-formulas/systemd-formula/commit/baaf5b3718359228a7d855f939ae941a71ec66d6))
* **kitchen:** use `develop` image until `master` is ready (`amazonlinux`) [skip ci] ([b14b414](https://github.com/saltstack-formulas/systemd-formula/commit/b14b414c90022375136daa064b1c95b802d79c53))
* **kitchen+travis:** upgrade matrix after `2019.2.2` release [skip ci] ([0fff6ac](https://github.com/saltstack-formulas/systemd-formula/commit/0fff6ac6fdbc22321e62ba7dd4493543fead95cb))
* **travis:** apply changes from build config validation [skip ci] ([910654e](https://github.com/saltstack-formulas/systemd-formula/commit/910654e43ecd1b546f295ea97482fb7080960227))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([9cbaced](https://github.com/saltstack-formulas/systemd-formula/commit/9cbaced8a330f08ec2d6af8c728bc182edc5e8a7))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([0a2547c](https://github.com/saltstack-formulas/systemd-formula/commit/0a2547c11339ad47684d67bd139de3c715477cd9))
* **travis:** run `shellcheck` during lint job [skip ci] ([90976bb](https://github.com/saltstack-formulas/systemd-formula/commit/90976bb934571ed5ac09d8dafb1778ef1592d094))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([788b9ae](https://github.com/saltstack-formulas/systemd-formula/commit/788b9aee583f9d262893a7b98c05797011e7ca87))
* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([59f1b38](https://github.com/saltstack-formulas/systemd-formula/commit/59f1b3871f07359ce46742ecb7a86b4b5f0162e0))
* **travis:** use build config validation (beta) [skip ci] ([dfa502a](https://github.com/saltstack-formulas/systemd-formula/commit/dfa502ae7d3f5f2b2c9e1714f99e7bfc91c011f0))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([0da36bb](https://github.com/saltstack-formulas/systemd-formula/commit/0da36bbcbbef3dbe8776b291ef3c7c96fd9888d1))

# [0.14.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.3...v0.14.0) (2019-10-19)


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/9bf7026))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/dfbd9e9))


### Features

* **centos-8:** support centos 8 ([](https://github.com/saltstack-formulas/systemd-formula/commit/7125240))

## [0.13.3](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.2...v0.13.3) (2019-10-12)


### Bug Fixes

* **rubocop:** add fixes using `rubocop --safe-auto-correct` ([](https://github.com/saltstack-formulas/systemd-formula/commit/a07960c))


### Continuous Integration

* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/systemd-formula/commit/01790ff))
* **travis:** merge `rubocop` linter into main `lint` job ([](https://github.com/saltstack-formulas/systemd-formula/commit/359e452))

## [0.13.2](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.1...v0.13.2) (2019-10-10)


### Bug Fixes

* **init.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/systemd-formula/commit/0af5472))
* **init.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/systemd-formula/commit/8d98cae))
* **map.jinja:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/systemd-formula/commit/68110aa))


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([](https://github.com/saltstack-formulas/systemd-formula/commit/7c870eb))
* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/f02b97e))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/e084acd))
* **kitchen+travis:** replace EOL pre-salted images ([](https://github.com/saltstack-formulas/systemd-formula/commit/d95f553))
* **platform:** add `arch-base-latest` ([](https://github.com/saltstack-formulas/systemd-formula/commit/021c7d0))
* **yamllint:** add rule `empty-values` & use new `yaml-files` setting ([](https://github.com/saltstack-formulas/systemd-formula/commit/f2582c6))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/systemd-formula/commit/a9f9889))
* use `dist: bionic` & apply `opensuse-leap-15` SCP error workaround ([](https://github.com/saltstack-formulas/systemd-formula/commit/3ca9b60))

## [0.13.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.0...v0.13.1) (2019-08-25)


### Documentation

* **readme:** update testing section ([9d4bd7e](https://github.com/saltstack-formulas/systemd-formula/commit/9d4bd7e))

# [0.13.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.3...v0.13.0) (2019-08-17)


### Features

* **yamllint:** include for this repo and apply rules throughout ([acbfdb3](https://github.com/saltstack-formulas/systemd-formula/commit/acbfdb3))

## [0.12.3](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.2...v0.12.3) (2019-07-21)


### Bug Fixes

* **path:** specify unit type when enabling systemd unit ([7f5dd9b](https://github.com/saltstack-formulas/systemd-formula/commit/7f5dd9b)), closes [#41](https://github.com/saltstack-formulas/systemd-formula/issues/41)
* **tofs:** reinstate custom TOFS files in this formula ([1b9b2b6](https://github.com/saltstack-formulas/systemd-formula/commit/1b9b2b6))


### Continuous Integration

* **kitchen+travis:** modify matrix to include `develop` platform ([ac12027](https://github.com/saltstack-formulas/systemd-formula/commit/ac12027))

## [0.12.2](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.1...v0.12.2) (2019-05-27)


### Bug Fixes

* **`networkd`:** don't remove files when using profiles ([93c29e2](https://github.com/saltstack-formulas/systemd-formula/commit/93c29e2))

## [0.12.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.0...v0.12.1) (2019-05-27)


### Documentation

* **tofs:** apply remaining comments from PR [#37](https://github.com/saltstack-formulas/systemd-formula/issues/37) ([d665676](https://github.com/saltstack-formulas/systemd-formula/commit/d665676))

# [0.12.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.11.0...v0.12.0) (2019-05-26)


### Continuous Integration

* **kichen+travis:** test with pre-salted Docker images ([0e5776c](https://github.com/saltstack-formulas/systemd-formula/commit/0e5776c))


### Features

* **tofs:** lookup files directory in “tpldir” hierarchy ([8d5b5ea](https://github.com/saltstack-formulas/systemd-formula/commit/8d5b5ea))

# [0.11.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.10.0...v0.11.0) (2019-05-13)


### Features

* **semantic-release:** implement an automated changelog ([eed041d](https://github.com/saltstack-formulas/systemd-formula/commit/eed041d))
