# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A panel plug-in to provide quick access to files, folders and removable media"
HOMEPAGE="https://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
SRC_URI="https://archive.xfce.org/src/panel-plugins/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="libnotify"

RDEPEND=">=dev-libs/glib-2.42:2
	>=x11-libs/gtk+-3.22:3
	x11-libs/libX11:=
	>=xfce-base/exo-0.6:=
	>=xfce-base/libxfce4ui-4.13:=
	>=xfce-base/libxfce4util-4.12:=
	>=xfce-base/xfce4-panel-4.12:=
	>=xfce-base/xfconf-4.12:=
	libnotify? ( >=x11-libs/libnotify-0.7:= )"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

src_configure() {
	local myconf=(
		$(use_enable libnotify notifications)
	)

	econf "${myconf[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}

