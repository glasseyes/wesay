using System;
using System.Globalization;
using NUnit.Framework;
using Palaso.I8N;
using Palaso.UI.WindowsForms.i8n;
using WeSay.LexicalModel.Foundation;

namespace WeSay.LexicalModel.Tests.Foundation
{
	[TestFixture]
	public class SpellCheckerIdToDisplayStringConverterTests
	{
		private WritingSystem.SpellCheckerIdToDisplayStringConverter
			_spellCheckerIdToDisplayStringConverter;

		private string _idKnownToWindows;
		private string _idNotKnownToWindows;

		[SetUp]
		public void Setup()
		{
			_idKnownToWindows = "en_US";
			_idNotKnownToWindows = "xY_Xy";
			_spellCheckerIdToDisplayStringConverter =
				new WritingSystem.SpellCheckerIdToDisplayStringConverter();
			_spellCheckerIdToDisplayStringConverter.GetInstalledSpellCheckingIdsStrategy =
				delegate { return new string[] {_idKnownToWindows, _idNotKnownToWindows}; };
		}

		[Test]
		public void ConvertTo_None_None()
		{
			Assert.AreEqual("none",
							_spellCheckerIdToDisplayStringConverter.ConvertTo("none",
																			  typeof (string)));
		}

		[Test]
		[NUnit.Framework.Category("UsesObsoleteExpectedExceptionAttribute"), ExpectedException(typeof (NotSupportedException))]
		public void ConvertTo_ConvertingToAnythingButString_Throws()
		{
			_spellCheckerIdToDisplayStringConverter.ConvertTo("en_US", typeof (bool));
		}

		[Test]
		[NUnit.Framework.Category("UsesObsoleteExpectedExceptionAttribute"), ExpectedException(typeof (ArgumentNullException))]
		public void ConvertTo_ConvertingToNull_Throws()
		{
			_spellCheckerIdToDisplayStringConverter.ConvertTo("en_US", null);
		}

		[Test]
		public void ConvertTo_LanguageSupportingCultureInfo_ReturnsLanguageWithCultureInfo()
		{
			CultureInfo cultureInfo =
				CultureInfo.GetCultureInfoByIetfLanguageTag(_idKnownToWindows.Replace('_', '-'));
			string cultureInfoTail = " (" + cultureInfo.NativeName + ")";
			Assert.AreEqual(_idKnownToWindows + cultureInfoTail,
							_spellCheckerIdToDisplayStringConverter.ConvertTo(_idKnownToWindows,
																			  typeof (string)));
		}

		[Test]
		public void ConvertTo_LanguageNotSupportingCultureInfo_ReturnsLanguage()
		{
			Assert.AreEqual(_idNotKnownToWindows,
							_spellCheckerIdToDisplayStringConverter.ConvertTo(_idNotKnownToWindows,
																			  typeof (string)));
		}

		[Test]
		public void
			ConvertTo_LanguageWithoutSpellCheckerInstalled_ReturnsLanguageWithNotInstalledMessage
			()
		{
			string spellCheckingNotInstalledTail = " (" + StringCatalog.Get("Not installed") + ")";
			Assert.AreEqual("fr_CA" + spellCheckingNotInstalledTail,
							_spellCheckerIdToDisplayStringConverter.ConvertTo("fr_CA",
																			  typeof (string)));
		}

		[Test]
		public void ConvertFrom_None_ReturnsNone()
		{
			Assert.AreEqual("none",
							_spellCheckerIdToDisplayStringConverter.ConvertFrom("none"));
		}

		[Test]
		public void ConvertFrom_StringWithSpaces_ReturnsNonWhiteSpaceCharacterBeforeFirstSpace()
		{
			Assert.AreEqual("en_US",
							_spellCheckerIdToDisplayStringConverter.ConvertFrom(
								" en_US (English (United States))"));
		}
	}
}