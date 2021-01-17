using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Entities;
using DAL;

/// <summary>
/// Summary description for categoryManager
/// </summary>

namespace BLL
{
    public class categoryManager
    {
        private categoryRepository repo;
        public categoryManager()
        {
            repo = new categoryRepository();
        }

        public bool Update(string name,bool status,bool manyChoice, int catId)
        {
            return repo.Update(name,status,manyChoice,catId);
        }

        public bool DeleteCategory(int categoryId)
        {
            if(FindChildrenAndRemove(categoryId) == 0 || FindChildrenAndRemove(categoryId) == 1)
            {
                Delete(categoryId);
                return true;
            }
            return false;
        }

        public int FindChildrenAndRemove(int parentId)
        {
            var children = new List<category>();
            var dataTable = new DataTable();
            dataTable = repo.GetChildren(parentId, false);
            children = ToDataModel(dataTable);
            if (children == null || children.Count == 0)
            {
                return 1;
            }
            foreach (var child in children)
            {
                if (FindChildrenAndRemove(child.id) == 1) {
                    Delete(child.id);
                }
                else 
                {
                    FindChildrenAndRemove(child.id);
                    Delete(child.id);
                }
            }
            return 0;
        }

        public void Delete(int categoryId)
        {
            repo.delete(categoryId);
        }

        public category CreateTarget(string name,bool status,bool manyChoice)
        {
            DataRow dataRow = repo.CreateTarget(name,status,manyChoice);
            return ToDataModel(dataRow);
        }

        public category CreateSubGroup(string name, bool status,bool manyChoice,int parentId)
        {
            DataRow dataRow = repo.CreateSubGroup(name, status,manyChoice,parentId);
            return ToDataModel(dataRow);
        }

        public List<category> GetAllWithChilds(bool JustIsEnabled)
        {
            var categories = new List<category>();
            var dataTable = new DataTable();
            dataTable = repo.GetAll(JustIsEnabled);
            categories =  ToDataModel(dataTable);
            if(categories == null || categories.Count == 0)
            {
                return null;
            }
            foreach(var category in categories)
            {
                category.childs = GetChildren(category.id,JustIsEnabled);
            }
            return categories;
        }

        public List<category> GetChildren(int parentId,bool JustIsEnabled)
        {
            var children = new List<category>();
            var dataTable = new DataTable();
            dataTable = repo.GetChildren(parentId, JustIsEnabled);
            children = ToDataModel(dataTable);
            if (children == null || children.Count == 0)
            {
                return null;
            }
            foreach (var child in children)
            {
                child.childs = GetChildren(child.id, JustIsEnabled);
            }
            return children;
        }

        public category ToDataModel(DataRow dataRow)
        {
            if(dataRow == null)
            {
                return null;
            }

            var category = new category
            {
                id = dataRow.Field<int>("id"),
                title = dataRow.Field<string>("title"),
                status = dataRow.Field<bool>("status"),
                manyChoice = dataRow.Field<bool>("manyChoice")
            };

            return category;
        }

        public List<category> ToDataModel(DataTable dataTable)
        {
            if(dataTable == null)
            {
                return null;
            }

            return dataTable.Select().Select(dr => new category {
                id = dr.Field<int>("id"),
                title = dr.Field<string>("title"),
                status = dr.Field<bool>("status"),
                manyChoice = dr.Field<bool>("manyChoice"),
                parentID = dr.Field<int?>("catId") ?? 0
            }).ToList();
        }
    }
}
