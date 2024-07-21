import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [items, setItems] = useState([]);
  const [newItem, setNewItem] = useState('');

  useEffect(() => {
    async function fetchItems() {
      const response = await axios.get('http://localhost:5000/api/items');
      setItems(response.data);
    }
    fetchItems();
  }, []);

  const addItem = async () => {
    const response = await axios.post('http://localhost:5000/api/items', { name: newItem });
    setItems([...items, response.data]);
    setNewItem('');
  };

  return (
    <div>
      <h1>Items</h1>
      <ul>
        {items.map(item => (
          <li key={item._id}>{item.name}</li>
        ))}
      </ul>
      <input
        type="text"
        value={newItem}
        onChange={(e) => setNewItem(e.target.value)}
      />
      <button onClick={addItem}>Add Item</button>
    </div>
  );
}

export default App;
