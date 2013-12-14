# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/flashrom/flashrom-0.9.7.ebuild,v 1.2 2013/12/01 06:34:43 vapier Exp $

EAPI="5"

KEYWORDS="~arm"

DESCRIPTION="Chromium's fork of flashrom needed for the Samsung ARM Chromebook."
HOMEPAGE="http://git.chromium.org/gitweb/?p=chromiumos/third_party/flashrom.git"
LICENSE="GPL-2"
SLOT="0"

EGIT_REPO_URI="http://git.chromium.org/chromiumos/third_party/flashrom.git"
EGIT_BRANCH="release-R26-3701.B"

inherit eutils toolchain-funcs git-2

src_compile() {
	epatch "${FILESDIR}/${P}-stubbery.patch"
	emake WARNERROR=no CONFIG_SATAMV=no CONFIG_LINUX_I2C=no CONFIG_LINUX_SPI=yes
}

src_install() {
	mv flashrom google-flashrom
	dosbin google-flashrom
}

