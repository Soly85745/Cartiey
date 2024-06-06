class AutoSpareParts {
  String id;
  String image;
  String name;
  double price;
  double rate;
  String description;

  AutoSpareParts({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.description,
  });
}

List<AutoSpareParts> carsItems = [
  AutoSpareParts(
    id: '1',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Foil_filter.jpg?alt=media&token=3069cd9d-02d4-4ace-a837-eede1469531c',
    name: 'Oil Filter',
    price: 1250,
    rate: 4.5,
    description:
        'An oil filter is a crucial component in a car\'s engine system, responsible for filtering out contaminants from the engine oil to keep it clean and maintain optimal engine performance.',
  ),
  AutoSpareParts(
    id: '2',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fspark_plugs.jpg?alt=media&token=ef3b47d0-c859-4a8c-83a8-63ebcb9b2d32',
    name: 'Spark Plugs',
    price: 625,
    rate: 5.0,
    description:
        'Spark plugs are essential for igniting the air-fuel mixture in the engine\'s combustion chamber, providing the necessary spark to start the engine and ensure smooth operation.',
  ),
  AutoSpareParts(
    id: '3',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fshock_absorbers.jpg?alt=media&token=df74afa4-cb14-4362-9cb5-93307c8ad039',
    name: 'Shock Absorbers',
    price: 7500,
    rate: 4.6,
    description:
        'Shock absorbers, also known as dampers, are part of a car\'s suspension system that helps absorb and dampen the impact of road irregularities, providing a smoother ride and better handling.',
  ),
  AutoSpareParts(
    id: '4',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fengine_oil.jpg?alt=media&token=6aa35e91-4acb-4213-9a07-42102ad60687',
    name: 'Engine Oil',
    price: 1750,
    rate: 5.0,
    description:
        'Engine oil lubricates and cools the moving parts of the engine, reducing friction and heat buildup, thus prolonging the engine\'s life and ensuring optimal performance.',
  ),
  AutoSpareParts(
    id: '5',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fcar%20battery.jpg?alt=media&token=72eab089-ef80-4735-8252-9f827c42457b',
    name: 'Car Battery',
    price: 5000,
    rate: 4.8,
    description:
        'The car battery provides electrical energy to start the engine and power various electrical components in the vehicle, such as lights, audio system, and accessories.',
  ),
  AutoSpareParts(
    id: '6',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fwiper_blades.jpg?alt=media&token=aa49801f-39cd-45f7-a932-9f06d2e1531e',
    name: 'Wiper Blades',
    price: 1000,
    rate: 5.0,
    description:
        'Wiper blades are essential for maintaining visibility during rainy or snowy conditions by wiping away water, snow, or debris from the windshield, ensuring clear vision for the driver.',
  ),
  AutoSpareParts(
    id: '7',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fcar%20tires.jpg?alt=media&token=cc20b86d-1d33-41f2-9540-3262504d3ef4',
    name: 'Car Tires',
    price: 6000,
    rate: 4.8,
    description:
        'Car tires are the only contact point between the vehicle and the road, providing traction, stability, and handling. Quality tires are crucial for safe driving and optimal performance.',
  ),
  AutoSpareParts(
    id: '8',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fradiator.jpg?alt=media&token=9b67bdde-d075-42ab-9d4a-5d3b4252ff52',
    name: 'Radiator',
    price: 10000,
    rate: 4.7,
    description:
        'The radiator is a vital component of the car\'s cooling system, responsible for dissipating heat generated by the engine coolant to prevent overheating and maintain the engine\'s operating temperature within a safe range.',
  ),
  AutoSpareParts(
    id: '9',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fbrake_pads.jpg?alt=media&token=32d78692-2eb2-4d00-9379-17636cb91df2',
    name: 'Brake Pads',
    price: 3750,
    rate: 4.9,
    description:
        'Brake pads are friction materials that press against the brake rotors to slow down or stop the vehicle when the brake pedal is applied, converting kinetic energy into heat energy, thus enabling safe braking.',
  ),
  AutoSpareParts(
    id: '10',
    image:
        'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/AutoSparePartsPhoto%2Fair_filter.jpg?alt=media&token=c7335c8c-bd2f-46e5-83b5-60e20d2a47ea',
    name: 'Air Filter',
    price: 750,
    rate: 4.5,
    description:
        'The air filter prevents dust, dirt, and other contaminants from entering the engine\'s intake system, ensuring clean air supply for combustion and protecting the engine from damage and premature wear.',
  ),
];