package com.an.finder.controller;

import org.hibernate.transform.BasicTransformerAdapter;

import java.util.*;

public class MapOfListsResultTransformer<K, V> extends BasicTransformerAdapter {
    public List transformList(List collection) {
        final Map<K, List<V>> map = new HashMap<>();

        for (Object object : collection) {
            final Object[] objects = (Object[]) object;
            final K key = (K) objects[0];
            final V value = (V) objects[1];
            if (!map.containsKey(key)) {
                final List<V> list = new ArrayList<V>();
                list.add(value);
                map.put(key, list);
            } else {
                map.get(key).add(value);
            }
        }

        return Arrays.asList(map);
    }
}
