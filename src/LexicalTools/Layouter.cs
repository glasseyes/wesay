using System;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using WeSay.Language;
using WeSay.UI;

namespace WeSay.LexicalTools
{
	/// <summary>
	/// A Layouter is responsible for filling a detailed list with the contents
	/// of a single data object (e.g. LexSense, LexExample), etc.
	/// There are will normally be a single subclass per class of data,
	/// and each of these layout erstwhile call a different layouter for each
	/// child object (e.g. LexEntryLayouter would employ a SenseLayouter to display senses).
	/// </summary>
	public abstract class Layouter
	{
		/// <summary>
		/// The DetailList we are filling.
		/// </summary>
		protected DetailList _detailList;

		public Layouter(DetailList builder)
		{
			_detailList = builder;
		}

		/// <summary>
		/// actually add the widget's that are needed to the detailed list
		/// </summary>
		/// <param name="dataObject"></param>
		/// <returns></returns>
		public abstract int AddWidgets(IBindingList list, int index);

		internal abstract int AddWidgets(IBindingList list, int index, int row);

		protected Control MakeBoundEntry(WeSay.Language.MultiText text, WritingSystem writingSystem)
		{
			WeSayTextBox textBox = new WeSayTextBox(writingSystem);
			textBox.Text = text[writingSystem.Id];

			WeSay.UI.Binding binding = new WeSay.UI.Binding(text, writingSystem, textBox);
			binding.CurrentItemChanged += new EventHandler<CurrentItemEventArgs>(_detailList.OnBindingCurrentItemChanged);
			return textBox;
		}

		protected Control MakeGhostEntry(IBindingList list, string ghostPropertyName, WritingSystem writingSystem)
		{
			WeSayTextBox entry = new WeSayTextBox(writingSystem);
			MakeGhostBinding(list, ghostPropertyName, writingSystem, entry);
			return entry;
		}

		protected GhostBinding MakeGhostBinding(IBindingList list, string ghostPropertyName, WritingSystem writingSystem,
			WeSayTextBox entry)
		{
			WeSay.UI.GhostBinding binding = new WeSay.UI.GhostBinding(list, ghostPropertyName, writingSystem, entry);
			binding.Triggered += new GhostBinding.GhostTriggered(OnGhostBindingTriggered);
			binding.CurrentItemChanged += new EventHandler<CurrentItemEventArgs>(_detailList.OnBindingCurrentItemChanged);
			return binding;
		}

		protected virtual void OnGhostBindingTriggered(GhostBinding sender, IBindingList list, int index, System.EventArgs args)
		{
			AddWidgetsAfterGhostTrigger(list, index, sender.ReferenceControl);
		}

		protected void AddWidgetsAfterGhostTrigger(IBindingList list, int index, Control refControl)
		{
			int row    = _detailList.GetRowOfControl(refControl);
			AddWidgets(list, index, row);
			_detailList.MoveInsertionPoint(row);
		}

		protected int AddChildrenWidgets(Layouter layouter, IBindingList list, int insertAtRow , int rowCount)
		{
			int index = 0;

			foreach (object sense in list)
			{
				int r;
				if (insertAtRow < 0)
				{
					r = insertAtRow;    // just stick at the end
				}
				else
				{
					r = insertAtRow + rowCount;
				}
				rowCount+= layouter.AddWidgets(list, index, r);
				++index;
			}
			return rowCount;
		}
	}
}