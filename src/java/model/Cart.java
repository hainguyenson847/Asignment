/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.*;

/**
 *
 * @author DELL-PC
 */
public class Cart {

    private List<Item> listItems;

    public Cart() {
        listItems = new ArrayList<>();
    }

    public Cart(List<Item> listItems) {
        this.listItems = listItems;
    }

    public List<Item> getListItems() {
        return listItems;
    }

    public void setListItems(List<Item> listItems) {
        this.listItems = listItems;
    }

    // 
    public Item getItemByID(int id) {
        for (Item item : listItems) {
            if (item.getProduct().getPid()== id) {
                return item;
            }
        }
        return null;
    }

    //
    public int getQuantityByID(int id) {
        return getItemByID(id).getQuantity();
    }

    //
    public void addItem(Item t) {
        if (getItemByID(t.getProduct().getPid()) != null) {
            Item m = getItemByID(t.getProduct().getPid());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            listItems.add(t);
        }
    }

    // 
    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            listItems.remove(getItemByID(id));
        }
    }

    // lay gia san pham ban dau - gia chua sale
    public int getTotalPriceWithOutDiscount() {
        int total = 0;
        for (Item item : listItems) {
            total += (item.getQuantity() * item.getProduct().getSalePrice() * (1 - item.getProduct().getDiscount()));
        }
        return (int)(total / 1000) * 1000;
    }

    // lay gia ban - gia san pham da sale
    public int getTotalMoney() {
        int total = 0;
        for (Item item : listItems) {
            total += (int)((item.getQuantity() * (int)(item.getProduct().getSalePrice() * (1 - item.getProduct().getDiscount()))) / 1000);
        }
        return (int)(total) * 1000;
    }

    // 
    public List<Product> getlistProducts() {
        List<Product> list = new ArrayList<>();
        for (Item item : listItems) {
            list.add(item.getProduct());
        }
        return list;
    }

}
