
include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI for OTA upgrade
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+fw_download_tool +jsonfilter
PKG_VERSION:=1.2
PKG_RELEASE:=1
PKG_MAINTAINER:=jjm2473 <jjm2473@gmail.com>

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/install
        $(call BuildPackage/$(PKG_NAME)/install/default)
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) ./root/bin/ota $(1)/bin/ota
endef

$(eval $(call BuildPackage,$(PKG_NAME)))


# call BuildPackage - OpenWrt buildroot signature
