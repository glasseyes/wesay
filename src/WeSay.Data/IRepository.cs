using System;
using System.Collections.Generic;

using Palaso.Progress;

namespace WeSay.Data
{
	public interface IRepository<T>:IDisposable where T: class, new()
	{
		DateTime LastModified { get; }
		bool CanQuery { get; }
		bool CanPersist { get; }

		void Startup(ProgressState state);
		T CreateItem();
		int CountAllItems();
		RepositoryId GetId(T item);
		T GetItem(RepositoryId id);
		void DeleteItem(T item);
		void DeleteItem(RepositoryId id);
		void DeleteAllItems();
		RepositoryId[] GetAllItems();
		void SaveItem(T item);
		void SaveItems(IEnumerable<T> items);
		ResultSet<T> GetItemsMatching(Query query);
	}
}
