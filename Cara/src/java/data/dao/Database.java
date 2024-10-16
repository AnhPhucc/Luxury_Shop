package phuc.dev.data.dao;

import java.util.List;

import phuc.dev.data.impl.CategoryImpl;
import phuc.dev.data.impl.OrderImpl;
import phuc.dev.data.impl.OrderItemImpl;
import phuc.dev.data.impl.ProductImpl;
import phuc.dev.data.impl.UserImpl;
import phuc.dev.data.model.Category;

public class Database extends DatabaseDao {

    @Override
    public ProductDao getProductDao() {
        // TODO Auto-generated method stub
        return new ProductImpl();
    }

    @Override
    public CategoryDao getCategoryDao() {
        // TODO Auto-generated method stub
        return new CategoryImpl() {
			
			@Override
			public List<Category> hotCategory() {
				// TODO Auto-generated method stub
				return null;
			}
		};
    }

    @Override
    public OrderItemDao getOrderItemDao() {
        // TODO Auto-generated method stub
        return new OrderItemImpl();
    }

    @Override
    public OrderDao getOrderDao() {
        // TODO Auto-generated method stub
        return new OrderImpl();
    }

    @Override
    public UserDao getUserDao() {
        // TODO Auto-generated method stub
        return new UserImpl();
    }

}