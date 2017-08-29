#!/bin/bash
# server=build.palaso.org
# project=WeSay
# build=wesay1.6-xenial64-continuous
# root_dir=..
# Auto-generated by https://github.com/chrisvire/BuildUpdate.
# Do not edit this file by hand!

cd "$(dirname "$0")"

# *** Functions ***
force=0
clean=0

while getopts fc opt; do
case $opt in
f) force=1 ;;
c) clean=1 ;;
esac
done

shift $((OPTIND - 1))

copy_auto() {
if [ "$clean" == "1" ]
then
echo cleaning $2
rm -f ""$2""
else
where_curl=$(type -P curl)
where_wget=$(type -P wget)
if [ "$where_curl" != "" ]
then
copy_curl $1 $2
elif [ "$where_wget" != "" ]
then
copy_wget $1 $2
else
echo "Missing curl or wget"
exit 1
fi
fi
}

copy_curl() {
echo "curl: $2 <= $1"
if [ -e "$2" ] && [ "$force" != "1" ]
then
curl -# -L -z $2 -o $2 $1
else
curl -# -L -o $2 $1
fi
}

copy_wget() {
echo "wget: $2 <= $1"
f1=$(basename $1)
f2=$(basename $2)
cd $(dirname $2)
wget -q -L -N $1
# wget has no true equivalent of curl's -o option.
# Different versions of wget handle (or not) % escaping differently.
# A URL query is the only reason why $f1 and $f2 should differ.
if [ "$f1" != "$f2" ]; then mv $f2\?* $f2; fi
cd -
}


# *** Results ***
# build: wesay1.6-xenial64-continuous (WeSay15_Wesay16xenial64continuous)
# project: WeSay
# URL: http://build.palaso.org/viewType.html?buildTypeId=WeSay15_Wesay16xenial64continuous
# VCS: https://github.com/sillsdev/wesay.git [refs/heads/master]
# dependencies:
# [0] build: Chorus-Documentation (bt216)
#     project: Chorus
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt216
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Chorus_Help.chm"=>"common"}
#     VCS: https://github.com/sillsdev/chorushelp.git [master]
# [1] build: chorus-linux64-chorus-2.5 Continuous (ChorusLinux64v25Cont)
#     project: Chorus
#     URL: http://build.palaso.org/viewType.html?buildTypeId=ChorusLinux64v25Cont
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Chorus.exe"=>"lib/Release", "Chorus.exe.mdb"=>"lib/Release", "ChorusHub.exe"=>"lib/Release", "ChorusHub.exe.mdb"=>"lib/Release", "ChorusHubApp.exe"=>"lib/Release", "ChorusHubApp.exe.mdb"=>"lib/Release", "ChorusMerge.exe"=>"lib/Release", "ChorusMerge.exe.mdb"=>"lib/Release", "LibChorus.dll"=>"lib/Release", "LibChorus.dll.mdb"=>"lib/Release", "LibChorus.TestUtilities.dll"=>"lib/Release", "LibChorus.TestUtilities.dll.mdb"=>"lib/Release", "Autofac.dll"=>"lib/Release", "NDesk.DBus.dll"=>"lib/Release", "NDesk.DBus.dll.config"=>"lib/Release", "debug/**"=>"lib/Debug", "Mercurial-i686.zip"=>"lib/common", "MercurialExtensions/**"=>"MercurialExtensions", "Mercurial-x86_64.zip"=>"lib/common"}
#     VCS: https://github.com/sillsdev/chorus.git [chorus-2.5]
# [2] build: L10NSharp Version2.0 Mono continuous (bt271)
#     project: L10NSharp
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt271
#     clean: false
#     revision: l10nsharp-1.2.tcbuildtag
#     paths: {"L10NSharp.dll"=>"lib/Release", "L10NSharp.dll.mdb"=>"lib/Release"}
#     VCS: https://github.com/sillsdev/l10nsharp [Version2.0]
# [3] build: L10NSharp Version2.0 Mono continuous (bt271)
#     project: L10NSharp
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt271
#     clean: false
#     revision: l10nsharp-1.2.tcbuildtag
#     paths: {"L10NSharp.dll"=>"lib/Debug", "L10NSharp.dll.mdb"=>"lib/Debug"}
#     VCS: https://github.com/sillsdev/l10nsharp [Version2.0]
# [4] build: wesay-doc-default (bt184)
#     project: WeSay1.4
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt184
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"WeSay_Helps.chm"=>"common"}
#     VCS: http://hg.palaso.org/wesay-doc []
# [5] build: wesay-localize-dev Update Pot and Po (bt52)
#     project: WeSay1.4
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt52
#     clean: false
#     revision: latest.lastFinished
#     paths: {"*.po"=>"common"}
#     VCS: http://hg.palaso.org/wesay-tx []
# [6] build: palaso-linux64-libpalaso-2.6 Continuous (PalasoLinux64v26Cont)
#     project: libpalaso
#     URL: http://build.palaso.org/viewType.html?buildTypeId=PalasoLinux64v26Cont
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Enchant.Net.dll"=>"lib/Release", "Enchant.Net.dll.config"=>"lib/Release", "ibusdotnet.dll"=>"lib/Release", "Palaso.dll"=>"lib/Release", "Palaso.dll.mdb"=>"lib/Release", "Palaso.dll.config"=>"lib/Release", "Palaso.DictionaryServices.dll"=>"lib/Release", "Palaso.DictionaryServices.dll.mdb"=>"lib/Release", "Palaso.Lift.dll"=>"lib/Release", "Palaso.Lift.dll.mdb"=>"lib/Release", "Palaso.Media.dll"=>"lib/Release", "Palaso.Media.dll.mdb"=>"lib/Release", "Palaso.Media.dll.config"=>"lib/Release", "Palaso.Tests.dll"=>"lib/Release", "Palaso.Tests.dll.mdb"=>"lib/Release", "Palaso.TestUtilities.dll"=>"lib/Release", "Palaso.TestUtilities.dll.mdb"=>"lib/Release", "PalasoUIWindowsForms.dll"=>"lib/Release", "PalasoUIWindowsForms.dll.mdb"=>"lib/Release", "PalasoUIWindowsForms.dll.config"=>"lib/Release", "PalasoUIWindowsForms.GeckoBrowserAdapter.dll"=>"lib/Release", "PalasoUIWindowsForms.GeckoBrowserAdapter.dll.mdb"=>"lib/Release", "debug/**"=>"lib/Debug", "Ionic.Zip.dll"=>"lib/Release"}
#     VCS: https://github.com/sillsdev/libpalaso.git [libpalaso-2.6]

# make sure output directories exist
mkdir -p ../MercurialExtensions
mkdir -p ../MercurialExtensions/fixutf8
mkdir -p ../common
mkdir -p ../lib/Debug
mkdir -p ../lib/Release
mkdir -p ../lib/common

# download artifact dependencies
copy_auto https://build.palaso.org/guestAuth/repository/download/bt216/latest.lastSuccessful/Chorus_Help.chm ../common/Chorus_Help.chm
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/Chorus.exe?branch=%3Cdefault%3E ../lib/Release/Chorus.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/Chorus.exe.mdb?branch=%3Cdefault%3E ../lib/Release/Chorus.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/ChorusHub.exe?branch=%3Cdefault%3E ../lib/Release/ChorusHub.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/ChorusHub.exe.mdb?branch=%3Cdefault%3E ../lib/Release/ChorusHub.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/ChorusHubApp.exe?branch=%3Cdefault%3E ../lib/Release/ChorusHubApp.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/ChorusHubApp.exe.mdb?branch=%3Cdefault%3E ../lib/Release/ChorusHubApp.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/ChorusMerge.exe?branch=%3Cdefault%3E ../lib/Release/ChorusMerge.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/ChorusMerge.exe.mdb?branch=%3Cdefault%3E ../lib/Release/ChorusMerge.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/LibChorus.dll?branch=%3Cdefault%3E ../lib/Release/LibChorus.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/LibChorus.dll.mdb?branch=%3Cdefault%3E ../lib/Release/LibChorus.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/LibChorus.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Release/LibChorus.TestUtilities.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/LibChorus.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Release/LibChorus.TestUtilities.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/Autofac.dll?branch=%3Cdefault%3E ../lib/Release/Autofac.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/NDesk.DBus.dll?branch=%3Cdefault%3E ../lib/Release/NDesk.DBus.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/NDesk.DBus.dll.config?branch=%3Cdefault%3E ../lib/Release/NDesk.DBus.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/Autofac.dll?branch=%3Cdefault%3E ../lib/Debug/Autofac.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/Chorus.exe?branch=%3Cdefault%3E ../lib/Debug/Chorus.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/Chorus.exe.mdb?branch=%3Cdefault%3E ../lib/Debug/Chorus.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/ChorusHub.exe?branch=%3Cdefault%3E ../lib/Debug/ChorusHub.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/ChorusHub.exe.mdb?branch=%3Cdefault%3E ../lib/Debug/ChorusHub.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/ChorusMerge.exe?branch=%3Cdefault%3E ../lib/Debug/ChorusMerge.exe
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/ChorusMerge.exe.mdb?branch=%3Cdefault%3E ../lib/Debug/ChorusMerge.exe.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/LibChorus.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Debug/LibChorus.TestUtilities.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/LibChorus.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/LibChorus.TestUtilities.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/LibChorus.dll?branch=%3Cdefault%3E ../lib/Debug/LibChorus.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/LibChorus.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/LibChorus.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/NDesk.DBus.dll?branch=%3Cdefault%3E ../lib/Debug/NDesk.DBus.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/debug/NDesk.DBus.dll.config?branch=%3Cdefault%3E ../lib/Debug/NDesk.DBus.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/Mercurial-i686.zip?branch=%3Cdefault%3E ../lib/common/Mercurial-i686.zip
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/.guidsForInstaller.xml?branch=%3Cdefault%3E ../MercurialExtensions/.guidsForInstaller.xml
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/Dummy.txt?branch=%3Cdefault%3E ../MercurialExtensions/Dummy.txt
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/.gitignore?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/.gitignore
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/.guidsForInstaller.xml?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/.guidsForInstaller.xml
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/.hg_archival.txt?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/.hg_archival.txt
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/.hgignore?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/.hgignore
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/README.?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/README.
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/buildcpmap.py?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/buildcpmap.py
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/cpmap.pyc?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/cpmap.pyc
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/fixutf8.py?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/fixutf8.py
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/fixutf8.pyc?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/fixutf8.pyc
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/fixutf8.pyo?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/fixutf8.pyo
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/osutil.py?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/osutil.py
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/osutil.pyc?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/osutil.pyc
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/osutil.pyo?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/osutil.pyo
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/win32helper.py?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/win32helper.py
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/win32helper.pyc?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/win32helper.pyc
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/MercurialExtensions/fixutf8/win32helper.pyo?branch=%3Cdefault%3E ../MercurialExtensions/fixutf8/win32helper.pyo
copy_auto https://build.palaso.org/guestAuth/repository/download/ChorusLinux64v25Cont/latest.lastSuccessful/Mercurial-x86_64.zip?branch=%3Cdefault%3E ../lib/common/Mercurial-x86_64.zip
copy_auto https://build.palaso.org/guestAuth/repository/download/bt271/l10nsharp-1.2.tcbuildtag/L10NSharp.dll ../lib/Release/L10NSharp.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/bt271/l10nsharp-1.2.tcbuildtag/L10NSharp.dll.mdb ../lib/Release/L10NSharp.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/bt271/l10nsharp-1.2.tcbuildtag/L10NSharp.dll ../lib/Debug/L10NSharp.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/bt271/l10nsharp-1.2.tcbuildtag/L10NSharp.dll.mdb ../lib/Debug/L10NSharp.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/bt184/latest.lastSuccessful/WeSay_Helps.chm ../common/WeSay_Helps.chm
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.az.po ../common/wesay.az.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.da.po ../common/wesay.da.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.es.po ../common/wesay.es.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.fr.po ../common/wesay.fr.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.he.po ../common/wesay.he.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.hi.po ../common/wesay.hi.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.id.po ../common/wesay.id.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.is.po ../common/wesay.is.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.km.po ../common/wesay.km.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.lo.po ../common/wesay.lo.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.my.po ../common/wesay.my.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.nl.po ../common/wesay.nl.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.oc.po ../common/wesay.oc.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.pl.po ../common/wesay.pl.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.pt.po ../common/wesay.pt.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.ru.po ../common/wesay.ru.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.rw.po ../common/wesay.rw.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.sv.po ../common/wesay.sv.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.th.po ../common/wesay.th.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.tpi.po ../common/wesay.tpi.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.vi.po ../common/wesay.vi.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.zh_CN.po ../common/wesay.zh_CN.po
copy_auto https://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.zh_TW.po ../common/wesay.zh_TW.po
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Enchant.Net.dll?branch=%3Cdefault%3E ../lib/Release/Enchant.Net.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Enchant.Net.dll.config?branch=%3Cdefault%3E ../lib/Release/Enchant.Net.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/ibusdotnet.dll?branch=%3Cdefault%3E ../lib/Release/ibusdotnet.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.dll?branch=%3Cdefault%3E ../lib/Release/Palaso.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.dll.mdb?branch=%3Cdefault%3E ../lib/Release/Palaso.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.dll.config?branch=%3Cdefault%3E ../lib/Release/Palaso.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.DictionaryServices.dll?branch=%3Cdefault%3E ../lib/Release/Palaso.DictionaryServices.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.DictionaryServices.dll.mdb?branch=%3Cdefault%3E ../lib/Release/Palaso.DictionaryServices.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Lift.dll?branch=%3Cdefault%3E ../lib/Release/Palaso.Lift.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Lift.dll.mdb?branch=%3Cdefault%3E ../lib/Release/Palaso.Lift.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Media.dll?branch=%3Cdefault%3E ../lib/Release/Palaso.Media.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Media.dll.mdb?branch=%3Cdefault%3E ../lib/Release/Palaso.Media.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Media.dll.config?branch=%3Cdefault%3E ../lib/Release/Palaso.Media.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Tests.dll?branch=%3Cdefault%3E ../lib/Release/Palaso.Tests.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.Tests.dll.mdb?branch=%3Cdefault%3E ../lib/Release/Palaso.Tests.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Release/Palaso.TestUtilities.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Palaso.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Release/Palaso.TestUtilities.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/PalasoUIWindowsForms.dll?branch=%3Cdefault%3E ../lib/Release/PalasoUIWindowsForms.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/PalasoUIWindowsForms.dll.mdb?branch=%3Cdefault%3E ../lib/Release/PalasoUIWindowsForms.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/PalasoUIWindowsForms.dll.config?branch=%3Cdefault%3E ../lib/Release/PalasoUIWindowsForms.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/PalasoUIWindowsForms.GeckoBrowserAdapter.dll?branch=%3Cdefault%3E ../lib/Release/PalasoUIWindowsForms.GeckoBrowserAdapter.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/PalasoUIWindowsForms.GeckoBrowserAdapter.dll.mdb?branch=%3Cdefault%3E ../lib/Release/PalasoUIWindowsForms.GeckoBrowserAdapter.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Commons.Xml.Relaxng.dll?branch=%3Cdefault%3E ../lib/Debug/Commons.Xml.Relaxng.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Enchant.Net.dll?branch=%3Cdefault%3E ../lib/Debug/Enchant.Net.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Enchant.Net.dll.config?branch=%3Cdefault%3E ../lib/Debug/Enchant.Net.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Ionic.Zip.dll?branch=%3Cdefault%3E ../lib/Debug/Ionic.Zip.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/L10NSharp.dll?branch=%3Cdefault%3E ../lib/Debug/L10NSharp.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/NDesk.DBus.dll?branch=%3Cdefault%3E ../lib/Debug/NDesk.DBus.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/NDesk.DBus.dll.config?branch=%3Cdefault%3E ../lib/Debug/NDesk.DBus.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.BuildTasks.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.BuildTasks.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.DictionaryServices.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.DictionaryServices.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.DictionaryServices.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/Palaso.DictionaryServices.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Lift.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.Lift.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Lift.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/Palaso.Lift.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Media.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.Media.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Media.dll.config?branch=%3Cdefault%3E ../lib/Debug/Palaso.Media.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Media.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/Palaso.Media.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.TestUtilities.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/Palaso.TestUtilities.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Tests.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.Tests.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.Tests.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/Palaso.Tests.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.dll?branch=%3Cdefault%3E ../lib/Debug/Palaso.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.dll.config?branch=%3Cdefault%3E ../lib/Debug/Palaso.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/Palaso.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/Palaso.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll?branch=%3Cdefault%3E ../lib/Debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/PalasoUIWindowsForms.dll?branch=%3Cdefault%3E ../lib/Debug/PalasoUIWindowsForms.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/PalasoUIWindowsForms.dll.config?branch=%3Cdefault%3E ../lib/Debug/PalasoUIWindowsForms.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/PalasoUIWindowsForms.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/PalasoUIWindowsForms.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/SIL.Archiving.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Archiving.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/SIL.Archiving.dll.config?branch=%3Cdefault%3E ../lib/Debug/SIL.Archiving.dll.config
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/SIL.Archiving.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Archiving.dll.mdb
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/ibusdotnet.dll?branch=%3Cdefault%3E ../lib/Debug/ibusdotnet.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/irrKlang.NET4.dll?branch=%3Cdefault%3E ../lib/Debug/irrKlang.NET4.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/debug/taglib-sharp.dll?branch=%3Cdefault%3E ../lib/Debug/taglib-sharp.dll
copy_auto https://build.palaso.org/guestAuth/repository/download/PalasoLinux64v26Cont/latest.lastSuccessful/Ionic.Zip.dll?branch=%3Cdefault%3E ../lib/Release/Ionic.Zip.dll
# End of script
