
//ownership system in cairo

#[derive(Drop)]
struct Member {
    name: ByteArray,
    age: u8,
}

//snap operator
#[derive(Drop)]
struct Rectangle {
    height:u8,
    width:u8,
}

//make a reference
fn find_area(rec:@Rectangle) -> u8 {
    *rec.height * *rec.width
    //desnap operator
}




fn main() {
    let rec1 = Rectangle {height:3, width:4};
    //constructed a rectnagle 
    let area = find_area(@rec1);
    println!("the area of the rectangle is: {}", area);

}
