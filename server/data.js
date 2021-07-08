const obj1 = {
    id: 1,
    lat: 32.8801,
    lng: 117.234,
    name: "UCSD",
    address: "9500 Gilman Drive, La Jolla, CA",
    description: "This is UCSD",
    imageUrl: "https://ucsdnews.ucsd.edu/news_uploads/1280x800_210310-Rainbow7DSC_8071-UCSanDiego-ErikJepsen-1.jpg",
    price: 7.00,
  };
  
const obj2 = {
    id: 2,
    lat: 32.886,
    lng: 117.2426,
    name: "Café Ventanas",
    address: "9400 Gilman Drive, La Jolla, CA",
    description: "This is Café Ventanas",
    imageUrl: "https://hdh-web.ucsd.edu/images/Dining/cafeventanas/facility-Cafe-Ventanas.jpg",
    price: 5.00,
};

const obj3 = {
    id: 3,
    lat: 32.8788,
    lng: 117.2425,
    name: "Pines",
    address: "9300 Gilman Drive, La Jolla, CA",
    description: "This is Pines",
    imageUrl: "https://i.ytimg.com/vi/hQqdNd0tfKI/maxresdefault.jpg",
    price: 3.00,
};

const obj4 = {
    id: 4,
    lat: 32.8771,
    lng: 117.2396,
    name: "Soda & Swine",
    address: "9200 Gilman Drive, La Jolla, CA",
    description: "This is Soda & Swine",
    imageUrl: "https://cdn.vox-cdn.com/thumbor/TNj4RZuk8xI9f5RRk8pjZWRU9hI=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19207521/DSCF4204.jpg",
    price: 4.00,
};

const obj5 = {
    id: 5,
    lat: 32.8681,
    lng: 117.2503,
    name: "Scripps Institution of Oceanography",
    address: "9100 Gilman Drive, La Jolla, CA",
    description: "This is Scripps Institution of Oceanography",
    imageUrl: "https://www.hollisbc.com/wp-content/uploads/UCSD_ScrippsForum_0001_Carolines.jpg",
    price: 7.00,
};

 const user1 = {
    id: 1,
    active_spots : [obj1,obj2,obj3],
};


const arrayObj = { data: [obj1, obj2, obj3, obj4, obj5], };

module.exports.user1 = user1;
module.exports.arrayObj =  arrayObj;