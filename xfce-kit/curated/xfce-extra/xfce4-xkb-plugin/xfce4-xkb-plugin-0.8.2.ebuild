# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="XKB layout switching panel plug-in for the Xfce desktop environment"
HOMEPAGE="https://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
SRC_URI="https://archive.xfce.org/src/panel-plugins/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="BSD-2 GPL-2+"
SLOT="0"
KEYWORDS="*"

DEPEND="gnome-base/librsvg:=
	x11-libs/gtk+:3=
	x11-libs/libwnck:3=
	x11-libs/libX11:=
	>=x11-libs/libxklavier-5.3:=
	xfce-base/garcon:=
	>=xfce-base/libxfce4ui-4.12:=
	>=xfce-base/libxfce4util-4.12:=
	>=xfce-base/xfce4-panel-4.12:=
	>=xfce-base/xfconf-4.12.1:="
RDEPEND="${DEPEND}
	x11-apps/setxkbmap
	>=xfce-base/xfce4-settings-4.11"
BDEPEND="
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

src_configure() {
	local myconf=(
		--libexecdir="${EPREFIX}"/usr/$(get_libdir)
	)

	econf "${myconf[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
