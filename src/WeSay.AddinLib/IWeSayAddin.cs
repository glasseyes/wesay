using System;
using System.Drawing;
using System.Windows.Forms;
using Mono.Addins;

namespace WeSay.AddinLib
{
//    public interface IHasSettings
//    {
//        bool EditSettings();
//    }

	public delegate string FileLocater(string fileName);

	[TypeExtensionPoint]
	public interface IWeSayAddin
	{

		Image ButtonImage { get;}

		bool Available { get;}


		string LocalizedName
		{
			get;
		}

		string ShortDescription
		{
			get;
		}

		String ID
		{
			get;
		}

		void Launch(Form parentForm, ProjectInfo projectInfo);
	}

	public interface IWeSayAddinHasSettings
	{
		bool DoShowSettingsDialog(Form parentForm, ProjectInfo projectInfo);

		object Settings
		{
			get;
			set;
		}

	}

//    public interface IWeSayProjectAwareAddin
//    {
//        WeSay.Project.WeSayWordsProject Project
//        {
//            set;
//        }
//    }
}
