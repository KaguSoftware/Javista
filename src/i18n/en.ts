type EnShape = {
  brand: { name: { main: string; accent: string }; sub: string };
  hero: {
    headline1: string;
    headline2: string;
    headline3: string;
    headline4: string;
    openHours: string;
    items: string;
  };
  topbar: { order: string };
  filter: { all: string };
  stage: { item: string; items: string };
  modal: { spicy: string; price: string; addToOrder: string };
  toast: {
    empty: string;
    itemsOnDeckOne: string;
    itemsOnDeckMany: string;
    addedPrefix: string;
  };
  ticker: string[];
  categories: Record<string, string>;
};

const en: EnShape = {
  brand: {
    name: { main: "JA", accent: "VISTA" },
    sub: "Specialty Coffee",
  },
  hero: {
    headline1: "Coffee,",
    headline2: "matcha",
    headline3: "& slow",
    headline4: "mornings.",
    openHours: "Open Daily · 08:00 — 23:00",
    items: "items",
  },
  topbar: {
    order: "Order",
  },
  filter: {
    all: "All",
  },
  stage: {
    item: "item",
    items: "items",
  },
  modal: {
    spicy: "Spicy",
    price: "Price",
    addToOrder: "Add to Order",
  },
  toast: {
    empty: "Your cart is empty",
    itemsOnDeckOne: "{count} item in your cart",
    itemsOnDeckMany: "{count} items in your cart",
    addedPrefix: "Added · ",
  },
  ticker: [
    "Petra Roasting Co.",
    "Specialty Espresso",
    "Matcha Bar",
    "Cold Brew",
    "Hand-Brewed V60",
    "House-Made Lemonade",
    "Single Origin",
    "Slow Mornings",
    "Open Daily",
  ],
  categories: {
    "espresso-bar": "Espresso Bar",
    "matcha-bar": "Matcha Bar",
    "special": "Special",
    "brew-bar": "Brew Bar",
    "tea": "Tea",
    "hot-drinks": "Hot Drinks",
    "extras": "Extras",
    "iced-espresso": "Iced Espresso",
    "frozen": "Frozen",
    "smoothie": "Smoothie",
    "frappe": "Frappé",
    "iced-tea": "Iced Tea",
    "mocktail": "Mocktail",
    "cold-beverages": "Cold Beverages",
    "salads": "Salads",
    "croissants": "Croissants",
    "sandwiches": "Sandwiches",
    "cookies": "Cookies",
    "desserts": "Desserts",
  },
};

export default en;
export type Messages = EnShape;
