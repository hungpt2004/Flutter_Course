import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('shop_database2.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // Create tables in correct order based on dependencies
    await db.execute('''
    CREATE TABLE Shop (
      Shop_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Name NVARCHAR(255),
      Description NTEXT,
      PhoneNumber NVARCHAR(20),
      Address NVARCHAR(255),
      Email NVARCHAR(255)
    );
  ''');

    await db.execute('''
    CREATE TABLE Shop_Image (
      Shop_Image_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Url_Image TEXT,
      Shop_ID INTEGER,
      FOREIGN KEY (Shop_ID) REFERENCES Shop (Shop_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Brand (
      Brand_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Name NVARCHAR(255),
      Shop_ID INTEGER,
      FOREIGN KEY (Shop_ID) REFERENCES Shop (Shop_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Product (
      Product_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Name NVARCHAR(255),
      Description TEXT,
      Shop_ID INTEGER,
      FOREIGN KEY (Shop_ID) REFERENCES Shop (Shop_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Color (
      Color_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Name NVARCHAR(255)
    );
  ''');

    await db.execute('''
    CREATE TABLE Size (
      Size_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Size NVARCHAR(50)
    );
  ''');

    await db.execute('''
    CREATE TABLE Product_Color (
      Product_Color_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Color_ID INTEGER,
      Product_ID INTEGER,
      FOREIGN KEY (Color_ID) REFERENCES Color (Color_ID),
      FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Product_Size (
      Product_Size_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Price INTEGER,
      Amount INTEGER,
      Size_ID INTEGER,
      Product_Color_ID INTEGER,
      FOREIGN KEY (Size_ID) REFERENCES Size (Size_ID),
      FOREIGN KEY (Product_Color_ID) REFERENCES Product_Color (Product_Color_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Account (
      Account_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Email NVARCHAR(255),
      Password NVARCHAR(255),
      CMND NVARCHAR(20),
      Name NVARCHAR(255),
      Gender CHAR(1),
      DateOfBirth DATETIME,
      PhoneNumber NVARCHAR(20),
      AvatarURL NVARCHAR(255),
      Address NVARCHAR(255),
      Role INTEGER,
      Status INTEGER
    );
  ''');

    await db.execute('''
    CREATE TABLE Voucher (
      Voucher_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      name NVARCHAR(255),
      token NVARCHAR(255),
      Discount_Money INTEGER,
      Amount INTEGER,
      StartDate DATETIME,
      EndDate DATETIME,
      Min_Price INTEGER
    );
  ''');

    await db.execute('''
    CREATE TABLE Notification (
      Notification_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Title NVARCHAR(255),
      Description TEXT,
      CreateAt DATETIME,
      Shop_ID INTEGER,
      FOREIGN KEY (Shop_ID) REFERENCES Shop (Shop_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Reservation (
      Reservation_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Reservation_date DATETIME,
      Total_Price INTEGER,
      Payment_Method NVARCHAR(50),
      Status NVARCHAR(50),
      Account_ID INTEGER,
      FOREIGN KEY (Account_ID) REFERENCES Account (Account_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Reserved_Product_Size (
      Reserved_Product_Size_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Reservation_ID INTEGER,
      Product_Size_ID INTEGER,
      FOREIGN KEY (Reservation_ID) REFERENCES Reservation (Reservation_ID),
      FOREIGN KEY (Product_Size_ID) REFERENCES Product_Size (Product_Size_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Voucher_Account (
      Voucher_Account_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Status INTEGER,
      Account_ID INTEGER,
      Voucher_ID INTEGER,
      FOREIGN KEY (Account_ID) REFERENCES Account (Account_ID),
      FOREIGN KEY (Voucher_ID) REFERENCES Voucher (Voucher_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Review (
      Review_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Content TEXT,
      Rating INTEGER,
      Product_ID INTEGER,
      Account_ID INTEGER,
      FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
      FOREIGN KEY (Account_ID) REFERENCES Account (Account_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Favorite (
      Favorite_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Product_ID INTEGER,
      Account_ID INTEGER,
      FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
      FOREIGN KEY (Account_ID) REFERENCES Account (Account_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE UserTransaction (
      Transaction_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Transaction_Date DATETIME,
      Amount INTEGER,
      Account_ID INTEGER,
      FOREIGN KEY (Account_ID) REFERENCES Account (Account_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Payment_History (
      Payment_History_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Payment_Method NVARCHAR(50),
      Payment_Date DATETIME,
      Amount INTEGER,
      Account_ID INTEGER,
      FOREIGN KEY (Account_ID) REFERENCES Account (Account_ID)
    );
  ''');

    await db.execute('''
    CREATE TABLE Product_Category (
      Category_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      Name NVARCHAR(255)
    );
  ''');

    await db.execute('''
    CREATE TABLE Product_In_Category (
      Product_ID INTEGER,
      Category_ID INTEGER,
      PRIMARY KEY (Product_ID, Category_ID),
      FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
      FOREIGN KEY (Category_ID) REFERENCES Product_Category (Category_ID)
    );
  ''');
  }

  // CRUD methods for Shop table
  Future<int> createShop(Map<String, dynamic> shop) async {
    final db = await instance.database;
    return await db.insert('Shop', shop);
  }

  Future<List<Map<String, dynamic>>> getShops() async {
    final db = await instance.database;
    return await db.query('Shop');
  }

  Future<int> updateShop(Map<String, dynamic> shop) async {
    final db = await instance.database;
    final shopId = shop['Shop_ID'];
    return await db.update('Shop', shop, where: 'Shop_ID = ?', whereArgs: [shopId]);
  }

  Future<int> deleteShop(int id) async {
    final db = await instance.database;
    return await db.delete('Shop', where: 'Shop_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Shop_Image table
  Future<int> createShopImage(Map<String, dynamic> shopImage) async {
    final db = await instance.database;
    return await db.insert('Shop_Image', shopImage);
  }

  Future<List<Map<String, dynamic>>> getShopImages() async {
    final db = await instance.database;
    return await db.query('Shop_Image');
  }

  Future<int> updateShopImage(Map<String, dynamic> shopImage) async {
    final db = await instance.database;
    final shopImageId = shopImage['Shop_Image_ID'];
    return await db.update('Shop_Image', shopImage, where: 'Shop_Image_ID = ?', whereArgs: [shopImageId]);
  }

  Future<int> deleteShopImage(int id) async {
    final db = await instance.database;
    return await db.delete('Shop_Image', where: 'Shop_Image_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Brand table
  Future<int> createBrand(Map<String, dynamic> brand) async {
    final db = await instance.database;
    return await db.insert('Brand', brand);
  }

  Future<List<Map<String, dynamic>>> getBrands() async {
    final db = await instance.database;
    return await db.query('Brand');
  }

  Future<int> updateBrand(Map<String, dynamic> brand) async {
    final db = await instance.database;
    final brandId = brand['Brand_ID'];
    return await db.update('Brand', brand, where: 'Brand_ID = ?', whereArgs: [brandId]);
  }

  Future<int> deleteBrand(int id) async {
    final db = await instance.database;
    return await db.delete('Brand', where: 'Brand_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Product table
  Future<int> createProduct(Map<String, dynamic> product) async {
    final db = await instance.database;
    return await db.insert('Product', product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await instance.database;
    return await db.query('Product');
  }

  Future<int> updateProduct(Map<String, dynamic> product) async {
    final db = await instance.database;
    final productId = product['Product_ID'];
    return await db.update('Product', product, where: 'Product_ID = ?', whereArgs: [productId]);
  }

  Future<int> deleteProduct(int id) async {
    final db = await instance.database;
    return await db.delete('Product', where: 'Product_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Color table
  Future<int> createColor(Map<String, dynamic> color) async {
    final db = await instance.database;
    return await db.insert('Color', color);
  }

  Future<List<Map<String, dynamic>>> getColors() async {
    final db = await instance.database;
    return await db.query('Color');
  }

  Future<int> updateColor(Map<String, dynamic> color) async {
    final db = await instance.database;
    final colorId = color['Color_ID'];
    return await db.update('Color', color, where: 'Color_ID = ?', whereArgs: [colorId]);
  }

  Future<int> deleteColor(int id) async {
    final db = await instance.database;
    return await db.delete('Color', where: 'Color_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Size table
  Future<int> createSize(Map<String, dynamic> size) async {
    final db = await instance.database;
    return await db.insert('Size', size);
  }

  Future<List<Map<String, dynamic>>> getSizes() async {
    final db = await instance.database;
    return await db.query('Size');
  }

  Future<int> updateSize(Map<String, dynamic> size) async {
    final db = await instance.database;
    final sizeId = size['Size_ID'];
    return await db.update('Size', size, where: 'Size_ID = ?', whereArgs: [sizeId]);
  }

  Future<int> deleteSize(int id) async {
    final db = await instance.database;
    return await db.delete('Size', where: 'Size_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Product_Color table
  Future<int> createProductColor(Map<String, dynamic> productColor) async {
    final db = await instance.database;
    return await db.insert('Product_Color', productColor);
  }

  Future<List<Map<String, dynamic>>> getProductColors() async {
    final db = await instance.database;
    return await db.query('Product_Color');
  }

  Future<int> updateProductColor(Map<String, dynamic> productColor) async {
    final db = await instance.database;
    final productColorId = productColor['Product_Color_ID'];
    return await db.update('Product_Color', productColor, where: 'Product_Color_ID = ?', whereArgs: [productColorId]);
  }

  Future<int> deleteProductColor(int id) async {
    final db = await instance.database;
    return await db.delete('Product_Color', where: 'Product_Color_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Product_Size table
  Future<int> createProductSize(Map<String, dynamic> productSize) async {
    final db = await instance.database;
    return await db.insert('Product_Size', productSize);
  }

  Future<List<Map<String, dynamic>>> getProductSizes() async {
    final db = await instance.database;
    return await db.query('Product_Size');
  }

  Future<int> updateProductSize(Map<String, dynamic> productSize) async {
    final db = await instance.database;
    final productSizeId = productSize['Product_Size_ID'];
    return await db.update('Product_Size', productSize, where: 'Product_Size_ID = ?', whereArgs: [productSizeId]);
  }

  Future<int> deleteProductSize(int id) async {
    final db = await instance.database;
    return await db.delete('Product_Size', where: 'Product_Size_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Account table
  Future<int> createAccount(Map<String, dynamic> account) async {
    final db = await instance.database;
    return await db.insert('Account', account);
  }

  Future<List<Map<String, dynamic>>> getAccounts() async {
    final db = await instance.database;
    return await db.query('Account');
  }

  Future<int> updateAccount(Map<String, dynamic> account) async {
    final db = await instance.database;
    final accountId = account['Account_ID'];
    return await db.update('Account', account, where: 'Account_ID = ?', whereArgs: [accountId]);
  }

  Future<int> deleteAccount(int id) async {
    final db = await instance.database;
    return await db.delete('Account', where: 'Account_ID = ?', whereArgs: [id]);
  }

  // CRUD methods for Voucher table
  Future<int> createVoucher(Map<String, dynamic> voucher) async {
    final db = await instance.database;
    return await db.insert('Voucher', voucher);
  }

  Future<List<Map<String, dynamic>>> getVouchers() async {
    final db = await instance.database;
    return await db.query('Voucher');
  }

  Future<int> updateVoucher(Map<String, dynamic> voucher) async {
    final db = await instance.database;
    final voucherId = voucher['Voucher_ID'];
    return await db.update('Voucher', voucher, where: 'Voucher_ID = ?', whereArgs: [voucherId]);
  }

  Future<int> deleteVoucher(int id) async {
    final db = await instance.database;
    return await db.delete('Voucher', where: 'Voucher_ID = ?', whereArgs: [id]);
  }





  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
