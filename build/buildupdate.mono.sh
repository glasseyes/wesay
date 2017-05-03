#!/bin/bash
# server=build.palaso.org
# build_type=bt456
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
# build: wesay1.9-trusty64-continuous (bt456)
# project: WeSay1.5
# URL: http://build.palaso.org/viewType.html?buildTypeId=bt456
# VCS: https://github.com/sillsdev/wesay.git [SILWritingSystems]
# dependencies:
# [0] build: Chorus-Documentation (bt216)
#     project: Chorus
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt216
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Chorus_Help.chm"=>"common"}
#     VCS: https://github.com/sillsdev/chorushelp.git [master]
# [1] build: chorus-trusty64-master Continuous [build only] (bt459)
#     project: Chorus
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt459
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Chorus.exe"=>"lib/Release", "Chorus.exe.mdb"=>"lib/Release", "ChorusHub.exe"=>"lib/Release", "ChorusHub.exe.mdb"=>"lib/Release", "ChorusHubApp.exe"=>"lib/Release", "ChorusHubApp.exe.mdb"=>"lib/Release", "ChorusMerge.exe"=>"lib/Release", "ChorusMerge.exe.mdb"=>"lib/Release", "LibChorus.dll"=>"lib/Release", "LibChorus.dll.mdb"=>"lib/Release", "LibChorus.TestUtilities.dll"=>"lib/Release", "LibChorus.TestUtilities.dll.mdb"=>"lib/Release", "Autofac.dll"=>"lib/Release", "NDesk.DBus.dll"=>"lib/Release", "NDesk.DBus.dll.config"=>"lib/Release", "debug/**"=>"lib/Debug", "Mercurial-i686.zip"=>"lib/common", "Mercurial-x86_64.zip"=>"lib/common"}
#     VCS: https://github.com/sillsdev/chorus.git [master]
# [2] build: L10NSharp Version2.0 Mono continuous (bt271)
#     project: L10NSharp
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt271
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"L10NSharp.dll"=>"lib/Release", "L10NSharp.dll.mdb"=>"lib/Release"}
#     VCS: https://github.com/sillsdev/l10nsharp [Version2.0]
# [3] build: L10NSharp Version2.0 Mono continuous (bt271)
#     project: L10NSharp
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt271
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"L10NSharp.dll"=>"lib/Debug", "L10NSharp.dll.mdb"=>"lib/Debug"}
#     VCS: https://github.com/sillsdev/l10nsharp [Version2.0]
# [4] build: icucil-precise64-icu52 Continuous (bt413)
#     project: Archived
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt413
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"icu.net.*"=>"lib/Debug/icu52"}
#     VCS: https://github.com/sillsdev/icu-dotnet [master]
# [5] build: icucil-precise64-icu52 Continuous (bt413)
#     project: Archived
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt413
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"icu.net.*"=>"lib/Release/icu52"}
#     VCS: https://github.com/sillsdev/icu-dotnet [master]
# [6] build: wesay-doc-default (bt184)
#     project: WeSay1.4
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt184
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"WeSay_Helps.chm"=>"common"}
#     VCS: http://hg.palaso.org/wesay-doc []
# [7] build: wesay-localize-dev Update Pot and Po (bt52)
#     project: WeSay1.4
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt52
#     clean: false
#     revision: latest.lastFinished
#     paths: {"*.po"=>"common"}
#     VCS: http://hg.palaso.org/wesay-tx []
# [8] build: palaso-trusty64-libpalaso-3.1 Continuous (bt324)
#     project: libpalaso
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt324
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Enchant.Net.dll"=>"lib/Release", "Enchant.Net.dll.config"=>"lib/Release", "ibusdotnet.dll"=>"lib/Release", "SIL.Archiving.dll"=>"lib/Release", "SIL.Archiving.dll.mdb"=>"lib/Release", "SIL.Core.dll"=>"lib/Release", "SIL.Core.dll.mdb"=>"lib/Release", "SIL.Core.dll.config"=>"lib/Release", "SIL.Core.Tests.dll"=>"lib/Release", "SIL.Core.Tests.dll.mdb"=>"lib/Release", "SIL.DictionaryServices.dll"=>"lib/Release", "SIL.DictionaryServices.dll.mdb"=>"lib/Release", "SIL.Lexicon.dll"=>"lib/Release", "SIL.Lexicon.dll.mdb"=>"lib/Release", "SIL.Lift.dll"=>"lib/Release", "SIL.Lift.dll.mdb"=>"lib/Release", "SIL.Media.dll"=>"lib/Release", "SIL.Media.dll.mdb"=>"lib/Release", "SIL.Media.dll.config"=>"lib/Release", "SIL.Scripture.dll"=>"lib/Release", "SIL.Scripture.dll.mdb"=>"lib/Release", "SIL.TestUtilities.dll"=>"lib/Release", "SIL.TestUtilities.dll.mdb"=>"lib/Release", "SIL.Windows.Forms.dll"=>"lib/Release", "SIL.Windows.Forms.dll.mdb"=>"lib/Release", "SIL.Windows.Forms.dll.config"=>"lib/Release", "SIL.Windows.Forms.GeckoBrowserAdapter.dll"=>"lib/Release", "SIL.Windows.Forms.GeckoBrowserAdapter.dll.mdb"=>"lib/Release", "SIL.Windows.Forms.Keyboarding.dll"=>"lib/Release", "SIL.Windows.Forms.Keyboarding.dll.mdb"=>"lib/Release", "SIL.Windows.Forms.Scripture.dll"=>"lib/Release", "SIL.Windows.Forms.Scripture.dll.mdb"=>"lib/Release", "SIL.Windows.Forms.WritingSystems.dll"=>"lib/Release", "SIL.Windows.Forms.WritingSystems.dll.mdb"=>"lib/Release", "SIL.WritingSystems.dll"=>"lib/Release", "SIL.WritingSystems.dll.mdb"=>"lib/Release", "SIL.WritingSystems.Tests.dll"=>"lib/Release", "SIL.WritingSystems.Tests.dll.mdb"=>"lib/Release", "Ionic.Zip.dll"=>"lib/Release", "Spart.dll"=>"lib/Release", "taglib-sharp.dll"=>"lib/Release"}
#     VCS: https://github.com/sillsdev/libpalaso.git [libpalaso-3.1]
# [9] build: palaso-trusty64-libpalaso-3.1 Continuous (bt324)
#     project: libpalaso
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt324
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"debug/Enchant.Net.dll"=>"lib/Debug", "debug/Enchant.Net.dll.config"=>"lib/Debug", "debug/ibusdotnet.dll"=>"lib/Debug", "debug/SIL.Archiving.dll"=>"lib/Debug", "debug/SIL.Archiving.dll.mdb"=>"lib/Debug", "debug/SIL.Core.dll"=>"lib/Debug", "debug/SIL.Core.dll.mdb"=>"lib/Debug", "debug/SIL.Core.dll.config"=>"lib/Debug", "debug/SIL.Core.Tests.dll"=>"lib/Debug", "debug/SIL.Core.Tests.dll.mdb"=>"lib/Debug", "debug/SIL.DictionaryServices.dll"=>"lib/Debug", "debug/SIL.DictionaryServices.dll.mdb"=>"lib/Debug", "debug/SIL.Lexicon.dll"=>"lib/Debug", "debug/SIL.Lexicon.dll.mdb"=>"lib/Debug", "debug/SIL.Lift.dll"=>"lib/Debug", "debug/SIL.Lift.dll.mdb"=>"lib/Debug", "debug/SIL.Media.dll"=>"lib/Debug", "debug/SIL.Media.dll.mdb"=>"lib/Debug", "debug/SIL.Media.dll.config"=>"lib/Debug", "debug/SIL.Scripture.dll"=>"lib/Debug", "debug/SIL.Scripture.dll.mdb"=>"lib/Debug", "debug/SIL.TestUtilities.dll"=>"lib/Debug", "debug/SIL.TestUtilities.dll.mdb"=>"lib/Debug", "debug/SIL.Windows.Forms.dll"=>"lib/Debug", "debug/SIL.Windows.Forms.dll.mdb"=>"lib/Debug", "debug/SIL.Windows.Forms.dll.config"=>"lib/Debug", "debug/SIL.Windows.Forms.GeckoBrowserAdapter.dll"=>"lib/Debug", "debug/SIL.Windows.Forms.GeckoBrowserAdapter.dll.mdb"=>"lib/Debug", "debug/SIL.Windows.Forms.Keyboarding.dll"=>"lib/Debug", "debug/SIL.Windows.Forms.Keyboarding.dll.mdb"=>"lib/Debug", "debug/SIL.Windows.Forms.Scripture.dll"=>"lib/Debug", "debug/SIL.Windows.Forms.Scripture.dll.mdb"=>"lib/Debug", "debug/SIL.Windows.Forms.WritingSystems.dll"=>"lib/Debug", "debug/SIL.Windows.Forms.WritingSystems.dll.mdb"=>"lib/Debug", "debug/SIL.WritingSystems.dll"=>"lib/Debug", "debug/SIL.WritingSystems.dll.mdb"=>"lib/Debug", "debug/SIL.WritingSystems.Tests.dll"=>"lib/Debug", "debug/SIL.WritingSystems.Tests.dll.mdb"=>"lib/Debug", "debug/Ionic.Zip.dll"=>"lib/Debug", "debug/Spart.dll"=>"lib/Debug", "debug/taglib-sharp.dll"=>"lib/Debug"}
#     VCS: https://github.com/sillsdev/libpalaso.git [libpalaso-3.1]

# make sure output directories exist
mkdir -p ../common
mkdir -p ../lib/Debug
mkdir -p ../lib/Debug/icu52
mkdir -p ../lib/Release
mkdir -p ../lib/Release/icu52
mkdir -p ../lib/common

# download artifact dependencies
copy_auto http://build.palaso.org/guestAuth/repository/download/bt216/latest.lastSuccessful/Chorus_Help.chm ../common/Chorus_Help.chm
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/Chorus.exe?branch=%3Cdefault%3E ../lib/Release/Chorus.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/Chorus.exe.mdb?branch=%3Cdefault%3E ../lib/Release/Chorus.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/ChorusHub.exe?branch=%3Cdefault%3E ../lib/Release/ChorusHub.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/ChorusHub.exe.mdb?branch=%3Cdefault%3E ../lib/Release/ChorusHub.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/ChorusHubApp.exe?branch=%3Cdefault%3E ../lib/Release/ChorusHubApp.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/ChorusHubApp.exe.mdb?branch=%3Cdefault%3E ../lib/Release/ChorusHubApp.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/ChorusMerge.exe?branch=%3Cdefault%3E ../lib/Release/ChorusMerge.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/ChorusMerge.exe.mdb?branch=%3Cdefault%3E ../lib/Release/ChorusMerge.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/LibChorus.dll?branch=%3Cdefault%3E ../lib/Release/LibChorus.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/LibChorus.dll.mdb?branch=%3Cdefault%3E ../lib/Release/LibChorus.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/LibChorus.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Release/LibChorus.TestUtilities.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/LibChorus.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Release/LibChorus.TestUtilities.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/Autofac.dll?branch=%3Cdefault%3E ../lib/Release/Autofac.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/NDesk.DBus.dll?branch=%3Cdefault%3E ../lib/Release/NDesk.DBus.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/NDesk.DBus.dll.config?branch=%3Cdefault%3E ../lib/Release/NDesk.DBus.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/Autofac.dll?branch=%3Cdefault%3E ../lib/Debug/Autofac.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/Chorus.exe?branch=%3Cdefault%3E ../lib/Debug/Chorus.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/Chorus.exe.mdb?branch=%3Cdefault%3E ../lib/Debug/Chorus.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/ChorusHub.exe?branch=%3Cdefault%3E ../lib/Debug/ChorusHub.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/ChorusHub.exe.mdb?branch=%3Cdefault%3E ../lib/Debug/ChorusHub.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/ChorusMerge.exe?branch=%3Cdefault%3E ../lib/Debug/ChorusMerge.exe
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/ChorusMerge.exe.mdb?branch=%3Cdefault%3E ../lib/Debug/ChorusMerge.exe.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/LibChorus.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Debug/LibChorus.TestUtilities.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/LibChorus.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/LibChorus.TestUtilities.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/LibChorus.dll?branch=%3Cdefault%3E ../lib/Debug/LibChorus.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/LibChorus.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/LibChorus.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/NDesk.DBus.dll?branch=%3Cdefault%3E ../lib/Debug/NDesk.DBus.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/debug/NDesk.DBus.dll.config?branch=%3Cdefault%3E ../lib/Debug/NDesk.DBus.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/Mercurial-i686.zip?branch=%3Cdefault%3E ../lib/common/Mercurial-i686.zip
copy_auto http://build.palaso.org/guestAuth/repository/download/bt459/latest.lastSuccessful/Mercurial-x86_64.zip?branch=%3Cdefault%3E ../lib/common/Mercurial-x86_64.zip
copy_auto http://build.palaso.org/guestAuth/repository/download/bt271/latest.lastSuccessful/L10NSharp.dll ../lib/Release/L10NSharp.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt271/latest.lastSuccessful/L10NSharp.dll.mdb ../lib/Release/L10NSharp.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt271/latest.lastSuccessful/L10NSharp.dll ../lib/Debug/L10NSharp.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt271/latest.lastSuccessful/L10NSharp.dll.mdb ../lib/Debug/L10NSharp.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt413/latest.lastSuccessful/icu.net.dll ../lib/Debug/icu52/icu.net.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt413/latest.lastSuccessful/icu.net.dll.config ../lib/Debug/icu52/icu.net.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt413/latest.lastSuccessful/icu.net.dll.mdb ../lib/Debug/icu52/icu.net.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt413/latest.lastSuccessful/icu.net.dll ../lib/Release/icu52/icu.net.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt413/latest.lastSuccessful/icu.net.dll.config ../lib/Release/icu52/icu.net.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt413/latest.lastSuccessful/icu.net.dll.mdb ../lib/Release/icu52/icu.net.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt184/latest.lastSuccessful/WeSay_Helps.chm ../common/WeSay_Helps.chm
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.az.po ../common/wesay.az.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.da.po ../common/wesay.da.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.es.po ../common/wesay.es.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.fr.po ../common/wesay.fr.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.he.po ../common/wesay.he.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.hi.po ../common/wesay.hi.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.id.po ../common/wesay.id.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.is.po ../common/wesay.is.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.km.po ../common/wesay.km.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.lo.po ../common/wesay.lo.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.my.po ../common/wesay.my.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.nl.po ../common/wesay.nl.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.oc.po ../common/wesay.oc.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.pl.po ../common/wesay.pl.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.pt.po ../common/wesay.pt.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.ru.po ../common/wesay.ru.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.rw.po ../common/wesay.rw.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.sv.po ../common/wesay.sv.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.th.po ../common/wesay.th.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.tpi.po ../common/wesay.tpi.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.vi.po ../common/wesay.vi.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.zh_CN.po ../common/wesay.zh_CN.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt52/latest.lastFinished/wesay.zh_TW.po ../common/wesay.zh_TW.po
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/Enchant.Net.dll?branch=%3Cdefault%3E ../lib/Release/Enchant.Net.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/Enchant.Net.dll.config?branch=%3Cdefault%3E ../lib/Release/Enchant.Net.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/ibusdotnet.dll?branch=%3Cdefault%3E ../lib/Release/ibusdotnet.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Archiving.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Archiving.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Archiving.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Archiving.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Core.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Core.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Core.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Core.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Core.dll.config?branch=%3Cdefault%3E ../lib/Release/SIL.Core.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Core.Tests.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Core.Tests.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Core.Tests.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Core.Tests.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.DictionaryServices.dll?branch=%3Cdefault%3E ../lib/Release/SIL.DictionaryServices.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.DictionaryServices.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.DictionaryServices.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Lexicon.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Lexicon.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Lexicon.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Lexicon.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Lift.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Lift.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Lift.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Lift.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Media.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Media.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Media.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Media.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Media.dll.config?branch=%3Cdefault%3E ../lib/Release/SIL.Media.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Scripture.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Scripture.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Scripture.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Scripture.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Release/SIL.TestUtilities.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.TestUtilities.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.dll.config?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.GeckoBrowserAdapter.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.GeckoBrowserAdapter.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.GeckoBrowserAdapter.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.GeckoBrowserAdapter.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.Keyboarding.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.Keyboarding.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.Keyboarding.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.Keyboarding.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.Scripture.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.Scripture.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.Scripture.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.Scripture.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.WritingSystems.dll?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.WritingSystems.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.Windows.Forms.WritingSystems.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.Windows.Forms.WritingSystems.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.WritingSystems.dll?branch=%3Cdefault%3E ../lib/Release/SIL.WritingSystems.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.WritingSystems.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.WritingSystems.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.WritingSystems.Tests.dll?branch=%3Cdefault%3E ../lib/Release/SIL.WritingSystems.Tests.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/SIL.WritingSystems.Tests.dll.mdb?branch=%3Cdefault%3E ../lib/Release/SIL.WritingSystems.Tests.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/Ionic.Zip.dll?branch=%3Cdefault%3E ../lib/Release/Ionic.Zip.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/Spart.dll?branch=%3Cdefault%3E ../lib/Release/Spart.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/taglib-sharp.dll?branch=%3Cdefault%3E ../lib/Release/taglib-sharp.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/Enchant.Net.dll?branch=%3Cdefault%3E ../lib/Debug/Enchant.Net.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/Enchant.Net.dll.config?branch=%3Cdefault%3E ../lib/Debug/Enchant.Net.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/ibusdotnet.dll?branch=%3Cdefault%3E ../lib/Debug/ibusdotnet.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Archiving.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Archiving.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Archiving.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Archiving.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Core.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Core.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Core.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Core.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Core.dll.config?branch=%3Cdefault%3E ../lib/Debug/SIL.Core.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Core.Tests.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Core.Tests.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Core.Tests.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Core.Tests.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.DictionaryServices.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.DictionaryServices.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.DictionaryServices.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.DictionaryServices.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Lexicon.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Lexicon.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Lexicon.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Lexicon.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Lift.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Lift.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Lift.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Lift.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Media.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Media.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Media.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Media.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Media.dll.config?branch=%3Cdefault%3E ../lib/Debug/SIL.Media.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Scripture.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Scripture.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Scripture.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Scripture.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.TestUtilities.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.TestUtilities.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.TestUtilities.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.TestUtilities.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.dll.config?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.dll.config
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.GeckoBrowserAdapter.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.GeckoBrowserAdapter.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.GeckoBrowserAdapter.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.GeckoBrowserAdapter.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.Keyboarding.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.Keyboarding.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.Keyboarding.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.Keyboarding.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.Scripture.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.Scripture.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.Scripture.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.Scripture.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.WritingSystems.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.WritingSystems.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.Windows.Forms.WritingSystems.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.Windows.Forms.WritingSystems.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.WritingSystems.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.WritingSystems.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.WritingSystems.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.WritingSystems.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.WritingSystems.Tests.dll?branch=%3Cdefault%3E ../lib/Debug/SIL.WritingSystems.Tests.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/SIL.WritingSystems.Tests.dll.mdb?branch=%3Cdefault%3E ../lib/Debug/SIL.WritingSystems.Tests.dll.mdb
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/Ionic.Zip.dll?branch=%3Cdefault%3E ../lib/Debug/Ionic.Zip.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/Spart.dll?branch=%3Cdefault%3E ../lib/Debug/Spart.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt324/latest.lastSuccessful/debug/taglib-sharp.dll?branch=%3Cdefault%3E ../lib/Debug/taglib-sharp.dll
# End of script
