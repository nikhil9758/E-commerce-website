var express=require('express');
var app=express();
var mysql = require('mysql');
var cookieParser= require('cookie-parser');
var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

var db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
 //socket   : '/Applications/MAMP/tmp/mysql/mysql.sock',
  database : 'jsp_eCommerce'
});

db.connect(function(err) {
    if (err){
      console.log(err);
      //throw err;
    } else {
      console.log('DB connected :)');
    }
});

app.use(express.static('public'));
app.use(cookieParser());
app.set('view engine', 'ejs');
app.set('views', 'views');


app.get('/',function(req,res){
	posts=[];
	res.render("home",{post:posts});
});

app.get('/products', function(req, res) {
  var products;
  db.query("SELECT * FROM products left join categories on categories.id=products.category", function (err, result, fields) {
    if (err) {
      throw err;
    } else {
     // console.log(result);
      res.render("product", {title: 'product', products: result});
    }
  });
});


app.get('/add-to-cart/:product', function(req, res) {

  let product = req.params.product.split("-")[1];
  //console.log(req.params.product)
  
  //Cart through cookie
  let products = [];
  if(req.cookies.node_express) {
    products = req.cookies.node_express;
  }
  /*products.push({
    id: req.params.product,
    qnt: 1
  });*/
  db.query("SELECT * FROM products left join categories on categories.id=products.category where pid='"+product+"'", function (err, result, fields) {
    if (err) {
      console.log(err)
      res.render('page', {title: 'About'});
    } else {
      let flag = 0;
      products.forEach(item => {
        if(item.pid == product) {
          flag = 1;
        }
      });
      //console.log(result);
      if(flag == 0) {
        products.push({
          pid: result[0].pid,
          title: result[0].title,
          name: result[0].name,
          price: result[0].price,
          picture: result[0].picture,
          qnt: 1
        });
      }
	  var sum=0;
	  res.cookie('node_express', products, {path:'/'});
     res.render('cart', {sums:sum , products: products});
	 
      
    }
  });
});

app.get('/remove-from-cart/:index', function(req, res) {
  let products = req.cookies.node_express;
  let index = req.params.index.split("-")[1];
  products.splice(index, 1);
  
  var sum=0;
  res.cookie('node_express', products, {path:'/'});
  res.render('cart', {sums:sum , products: products});
});

app.get('/empty-cart', function(req, res) {
  let products = [];
 
  var sum=0;
  res.cookie('node_express', products, {path:'/'});
  res.render('cart', {sums:sum , products: products});
});

app.get('/cart', function(req, res) {
  let products = [];
  products = req.cookies.node_express;
  //let session_products = [];
 var sum=0;
  //Using cookies
  //console.log(req.cookies.node_express_ecommerce);
    res.render('cart', {title: 'Cart', sums: sum, products: products});
});

app.post('/update-cart', function(req, res) {
  //console.log(req.cookies.node_express_ecommerce);
  //console.log(req.body);
  let products = req.cookies.node_express;
  products.forEach(function(product, index) {
    product.qnt = req.body.qnt[index];
	//console.log(product.qnt);
	//console.log(req.body.qnt[index]);
  });
  res.clearCookie('node_express', {path:'/'});
   var sum=0;
  res.cookie('node_express', products, {path:'/'});
  res.render('cart', {sums:sum , products: products});
});

app.get('/checkout',function(req,res){
	res.render('order',{title: "order"});
});


app.set('port', process.env.POST || 7000);

var server = app.listen(7000, function() {
  console.log('Running server');
});