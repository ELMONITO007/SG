using Entities;
using System.Collections.Generic;
using System.Data;

namespace Data
{
    public interface IRepository<TEntity> where TEntity : EntityBase
    {
        TEntity Create(TEntity entity);
        List<TEntity> Read();
        TEntity ReadBy(int id);
        void Update(TEntity entity);
        void Delete(int id);
    }


    public interface IRepository2<TEntity> where TEntity : EntityBase
        
    {
      
        TEntity ALoad(IDataReader dr);
        TEntity Create(TEntity entity);
        List<TEntity> Read();
        TEntity ReadBy(int id);
        TEntity ReadBy(string campo);
        void Update(TEntity entity);
        void Delete(int id);
    }
}
