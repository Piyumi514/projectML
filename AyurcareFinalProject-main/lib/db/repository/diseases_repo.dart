import 'package:ayurcare/db/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

import '../models/remedy_model.dart';

class DiseasesRepo {
  final CollectionReference _diseasesCollection =
      FirebaseFirestore.instance.collection('diseases');

  // final CollectionReference _decoctionCollection =
  // FirebaseFirestore.instance.collection('decoctions');

  // List<Map<String, String>> imageDetails = [
  //   {
  //     'url': 'assets/homeremedies/Tulsi Tea.jpg',
  //     "disease": "Asthma (ඇදුම)",
  //     'details':
  //         'Holy basil has immune-boosting and anti-inflammatory properties. Boil fresh basil leaves in water for 10-15 minutes. Strain and drink the decoction with honey for added benefits.Ginger and Turmeric Decoction: Combine sliced ginger and turmeric powder in water and boil for 10-15 minutes. Strain and drink the decoction warm with honey for added sweetness and anti-inflammatory effects.',
  //     'name': 'Holy Basil (Tulsi) Decoction'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Licorice Root.jpg',
  //     "disease": "Asthma (ඇදුම)",
  //     'details':
  //         'Licorice root is known for its anti-inflammatory and soothing properties. Boil licorice root in water for about 15 minutes, then strain and drink the decoction warm.Fennel Seed Decoction: Fennel seeds can help relax the bronchial muscles and reduce coughing. Boil a teaspoon of fennel seeds in water for 10 minutes. Strain and drink the decoction warm.',
  //     'name': 'Licorice Root Decoction'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Tulsi Tea.jpg',
  //     "disease": "Common cold (සෙම්ප්‍රතිශ්‍යාව)",
  //     'details':
  //     'Holy basil is revered in Ayurveda for its immune boosting properties. Boil fresh basil leaves in water for 10-15 minutes. Strain and drink the decoction with honey for added benefits. ',
  //     'name': 'Holy Basil (Tulsi) Decoction'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Licorice Root.jpg',
  //     "disease": "Common cold (සෙම්ප්‍රතිශ්‍යාව)",
  //     'details':
  //     ' Licorice root has anti-inflammatory and antiviral properties. Boil licorice root in water for about 15 minutes, then strain and drink the decoction warm. ',
  //     'name': 'Licorice Root Decoction'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Ginger and Turmeric.jpg',
  //     "disease": "Common cold (සෙම්ප්‍රතිශ්‍යාව)",
  //     'details':
  //     'Combine sliced ginger and turmeric powder in water and boil for 10-15 minutes. Strain and drink the decoction warm with honey for added sweetness.',
  //     'name': 'Ginger and Turmeric Decoction'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Cinnamon and Clove.jpg',
  //     "disease": "Common cold (සෙම්ප්‍රතිශ්‍යාව)",
  //     'details':
  //     ' Cinnamon and cloves have antimicrobial properties and can help alleviate cold symptoms. Boil a few cinnamon sticks and cloves in water for about 15 minutes. Strain and drink the decoction warm. ',
  //     'name': 'Cinnamon and Clove Decoction'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/gingerTea.jpg',
  //     "disease": "Indigestion (අජීර්ණය)",
  //     'details':
  //     ' Ginger is well-known for its digestive properties. Boil fresh ginger slices in water for about 10 minutes to make ginger tea. Drink it before or after meals to aid digestion and relieve indigestion symptoms.',
  //     'name': 'Ginger Tea'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Ajwain.jpg',
  //     "disease": "Indigestion (අජීර්ණය)",
  //     'details':
  //     'Ajwain seeds have carminative properties that can help relieve gas and bloating. Boil a teaspoon of ajwain seeds in water, strain, and drink the water either warm or at room temperature.',
  //     'name': 'Ajwain (Carom Seeds) Water'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Cumin and Coriander.jpg',
  //     "disease": "Indigestion (අජීර්ණය)",
  //     'details':
  //     ' Cumin and coriander seeds are both beneficial for digestion. Boil a teaspoon each of cumin and coriander seeds in water, strain, and drink the water as a digestive tonic. ',
  //     'name': 'Cumin and Coriander Water'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Mint Tea.jpg',
  //     "disease": "Indigestion (අජීර්ණය)",
  //     'details':
  //     ' Mint leaves have a soothing effect on the stomach and can help alleviate indigestion. Steep fresh mint leaves in hot water for a few minutes, strain, and drink the mint tea after meals. ',
  //     'name': 'Mint Tea'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Peppermint Oil.jpg',
  //     "disease": "Headache (හිසරදය)",
  //     'details':
  //     ' Peppermint oil has a cooling effect that can help alleviate headache pain. Dilute a few drops of peppermint oil with a carrier oil (such as coconut oil) and apply it to your temples, forehead, and the back of your neck. Be sure to do a patch test first to ensure you dont have any adverse reactions',
  //     'name': 'Peppermint Oil'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Ginger Paste.jpg',
  //     "disease": "Headache (හිසරදය)",
  //     'details':
  //     ' Ginger has anti-inflammatory properties that can help reduce headache pain, especially tension headaches. Grind fresh ginger into a paste and apply it to your forehead for relief.',
  //     'name': 'Ginger Paste'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Cold Compress.jpg',
  //     "disease": "Headache (හිසරදය)",
  //     'details':
  //     ' Applying a cold compress or ice pack to the affected area can help numb the pain and reduce inflammation. Wrap a few ice cubes in a towel and apply it to your forehead or temples for 15-20 minutes. ',
  //     'name': 'Cold Compress'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Herbal Tea.jpg',
  //     "disease": "Headache (හිසරදය)",
  //     'details':
  //     '  Certain herbal teas, such as chamomile, lavender, or basil tea, can help relax the body and alleviate headache symptoms. Brew a cup of herbal tea and sip it slowly to promote relaxation. ',
  //     'name': 'Herbal Tea'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Turmeric Paste.jpg',
  //     "disease": "Joint Pain/Arthritis (හන්දිපත් රුදාව)",
  //     'details':
  //     ' Turmeric contains curcumin, which has anti-inflammatory properties that can help reduce joint pain and inflammation. Mix turmeric powder with water to form a paste and apply it directly to the affected joints. You can also consume turmeric milk or add turmeric to your meals for additional benefits.',
  //     'name': 'Turmeric Paste'
  //   },
  //   {
  //     'url': 'assets/homeremedies/gingerTea.jpg',
  //     "disease": "Joint Pain/Arthritis (හන්දිපත් රුදාව)",
  //     'details':
  //     ' Ginger has natural anti-inflammatory properties that can help alleviate joint pain. Drink ginger tea regularly or add fresh ginger to your meals to reduce inflammation and improve joint mobility.',
  //     'name': 'Ginger Tea'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Warm Milk with Nutmeg.jpg',
  //     "disease": "Insomnia (නින්ද නොයාම)",
  //     'details':
  //     ' Warm milk contains tryptophan, an amino acid that promotes relaxation and induces sleep. Adding a pinch of nutmeg, which has sedative properties, can further enhance its sleep-inducing effects. Drink a glass of warm milk with a pinch of nutmeg before bedtime.',
  //     'name': 'Warm Milk with Nutmeg'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Chamomile Tea.jpg',
  //     "disease": "Insomnia (නින්ද නොයාම)",
  //     'details':
  //     'Chamomile is a gentle sedative herb that can help relax the mind and body, making it easier to fall asleep. Brew a cup of chamomile tea and drink it 30 minutes before bedtime to promote relaxation and improve sleep quality.',
  //     'name': 'Chamomile Tea'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Ashwagandha Powder.jpg',
  //     "disease": "Insomnia (නින්ද නොයාම)",
  //     'details':
  //     'Ashwagandha is an adaptogenic herb that helps reduce stress and anxiety, both of which can contribute to insomnia. Mix a teaspoon of ashwagandha powder in warm milk or water and drink it before bedtime to promote relaxation and better sleep. ',
  //     'name': 'Ashwagandha Powder'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Aromatherapy with Lavender Oil.jpg',
  //     "disease": "Insomnia (නින්ද නොයාම)",
  //     'details':
  //     'Lavender essential oil has calming and sedative properties that can help promote relaxation and improve sleep quality. Add a few drops of lavender oil to a diffuser or pillow before bedtime, or dilute it with a carrier oil and massage it onto your temples and pulse points.',
  //     'name': 'Aromatherapy with Lavender Oil'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Warm Water with Lemon.jpg',
  //     "disease": "Constipation (මලබද්ධය)",
  //     'details':
  //     'Drinking warm water with lemon juice first thing in the morning can help stimulate bowel movements and promote digestion. The acidity of lemon juice can also help soften stools. ',
  //     'name': 'Warm Water with Lemon'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Triphala Powder.jpg',
  //     "disease": "Constipation (මලබද්ධය)",
  //     'details':
  //     'Triphala is an Ayurvedic herbal remedy consisting of three fruits: amla, bibhitaki, and haritaki. It is known for its gentle laxative properties and can help regulate bowel movements. Mix a teaspoon of Triphala powder in warm water and drink it before bedtime. ',
  //     'name': 'Triphala Powder'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Fiber-Rich Foods.jpg',
  //     "disease": "Constipation (මලබද්ධය)",
  //     'details':
  //     'Increasing your intake of fiber-rich foods such as fruits, vegetables, whole grains, and legumes can help add bulk to stool and promote regular bowel movements. Include fiber-rich foods in your diet daily to prevent constipation.',
  //     'name': 'Fiber-Rich Foods'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Castor Oil.jpg',
  //     "disease": "Constipation (මලබද්ධය)",
  //     'details':
  //     ' Castor oil is a natural laxative that can help stimulate bowel movements. Take a teaspoon of castor oil on an empty stomach in the morning, followed by a glass of warm water. Be cautious with the dosage, as excessive use can lead to dependency. ',
  //     'name': 'Castor Oil'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Cloves.jpg',
  //     "disease": "Toothache (දත් කැක්කුම)",
  //     'details':
  //     ' Cloves have natural analgesic and antibacterial properties that can help numb tooth pain and reduce inflammation. Gently chew a whole clove near the affected tooth or apply clove oil to the painful area using a cotton ball. ',
  //     'name': 'Cloves'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Saltwater Rinse.jpg',
  //     "disease": "Toothache (දත් කැක්කුම)",
  //     'details':
  //     'A saltwater rinse can help reduce inflammation, kill bacteria, and alleviate toothache pain. Mix a teaspoon of salt in a glass of warm water and rinse your mouth thoroughly several times a day, especially after meals and before bedtime.',
  //     'name': 'Saltwater Rinse'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Garlic.jpg',
  //     "disease": "Toothache (දත් කැක්කුම)",
  //     'details':
  //     'Garlic has antimicrobial and analgesic properties that can help relieve toothache pain and fight oral bacteria. Crush a garlic clove to release its juices and apply it directly to the painful tooth or gum. ',
  //     'name': 'Garlic'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Peppermint Tea.jpg',
  //     "disease": "Toothache (දත් කැක්කුම)",
  //     'details':
  //     ' Peppermint has numbing properties that can help alleviate toothache pain. Brew a cup of peppermint tea, allow it to cool, and swish it around in your mouth for a few minutes before spitting it out.',
  //     'name': 'Peppermint Tea'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Aloe Vera Gel.jpg',
  //     "disease": "Skin Allergies (සමේ අසාත්මිකතා)",
  //     'details':
  //     'Aloe vera has soothing and anti-inflammatory properties that can help relieve itching and reduce skin inflammation associated with allergies. Apply fresh aloe vera gel directly to the affected skin and leave it on for 15-20 minutes before rinsing it off with water. ',
  //     'name': 'Aloe Vera Gel'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Coconut Oil.jpg',
  //     "disease": "Skin Allergies (සමේ අසාත්මිකතා)",
  //     'details':
  //     'Coconut oil has moisturizing and anti-inflammatory properties that can help soothe irritated skin and reduce itching. Apply pure coconut oil to the affected areas of the skin and gently massage it in until fully absorbed. ',
  //     'name': 'Coconut Oil'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Turmeric Paste.jpg',
  //     "disease": "Skin Allergies (සමේ අසාත්මිකතා)",
  //     'details':
  //     ' Turmeric contains curcumin, which has anti-inflammatory and antioxidant properties that can help alleviate skin inflammation and reduce itching associated with allergies. Mix turmeric powder with water to form a paste and apply it to the affected areas of the skin. Leave it on for 15-20 minutes before rinsing it off with water.',
  //     'name': 'Turmeric Paste'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Amla Oil.jpg',
  //     "disease": "Hair Loss (හිසකෙස් නැතිවීම)",
  //     'details':
  //     'Amla is rich in vitamin C and antioxidants, which can help nourish the hair follicles and promote hair growth. Massage amla oil into the scalp and leave it on overnight before washing it off with a mild shampoo the next morning.',
  //     'name': 'Amla (Indian Gooseberry) Oil'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Coconut Milk.jpg',
  //     "disease": "Hair Loss (හිසකෙස් නැතිවීම)",
  //     'details':
  //     ' Coconut milk contains vitamins and minerals that can help strengthen hair and promote hair growth. Apply fresh coconut milk to the scalp and hair, leave it on for 30 minutes, and then rinse it off with water. ',
  //     'name': 'Coconut Milk'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Rosemary Essential Oil.jpg',
  //     "disease": "Hair Loss (හිසකෙස් නැතිවීම)",
  //     'details':
  //     'Rosemary essential oil has stimulating properties that can help improve blood circulation to the scalp and promote hair growth. Mix a few drops of rosemary essential oil with a carrier oil (such as coconut oil or olive oil) and massage it into the scalp. Leave it on for at least 30 minutes before washing it off. ',
  //     'name': 'Rosemary Essential Oil'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Tulsi Tea.jpg',
  //     "disease": "Fever (උණ)",
  //     'details':
  //     ' Tulsi leaves have antipyretic properties that can help reduce fever and boost the immune system. Boil fresh tulsi leaves in water to make a tea. Drink this tea several times a day to help lower body temperature and relieve fever symptoms. ',
  //     'name': 'Tulsi (Holy Basil) Tea'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Ginger and Honey.jpg',
  //     "disease": "Fever (උණ)",
  //     'details':
  //     'Ginger has anti-inflammatory and antiviral properties that can help reduce fever symptoms. Mix ginger juice with honey and consume it several times a day to help alleviate fever and boost the immune system. ',
  //     'name': 'Ginger and Honey'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Rice Water.jpg',
  //     "disease": "Fever (උණ)",
  //     'details':
  //     'Rice water is a traditional remedy for fever in many cultures. Boil rice in water and strain the water. Drink this rice water several times a day to help hydrate the body and regulate body temperature during fever. ',
  //     'name': 'Rice Water'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Cold Compress.jpg',
  //     "disease": "Fever (උණ)",
  //     'details':
  //     'Applying a cold compress to the forehead, wrists, and armpits can help lower body temperature and provide relief from fever symptoms. Use a clean cloth soaked in cold water and apply it to the affected areas for a few minutes at a time. ',
  //     'name': 'Cold Compress'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Bananas.jpg',
  //     "disease": "Diarrhea (පාචනය)",
  //     'details':
  //     'Bananas are rich in potassium and pectin, which can help firm up stools and replace lost electrolytes during diarrhea. Eat ripe bananas or blend them into a smoothie for easy digestion. ',
  //     'name': 'Bananas'
  //   },
  //   {
  //     'url': 'assets/homeremedies/gingerTea.jpg',
  //     "disease": "Diarrhea (පාචනය)",
  //     'details':
  //     'Ginger has anti-inflammatory and antimicrobial properties that can help alleviate diarrhea symptoms. Steep fresh ginger slices in hot water to make ginger tea. Drink this tea several times a day to help reduce inflammation and relieve diarrhea. ',
  //     'name': 'Ginger Tea'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Rice Water.jpg',
  //     "disease": "Diarrhea (පාචනය)",
  //     'details':
  //     'Rice water is a traditional remedy for diarrhea in many cultures. Boil rice in water and strain the water. Drink this rice water throughout the day to help replace lost fluids and soothe the digestive tract.',
  //     'name': 'Rice Water'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Coconut Water.jpg',
  //     "disease": "Diarrhea (පාචනය)",
  //     'details':
  //     'Coconut water is rich in electrolytes and can help replenish lost fluids and minerals during diarrhea. Drink fresh coconut water throughout the day to stay hydrated and prevent dehydration. ',
  //     'name': 'Coconut Water'
  //   },
  //
  //   {
  //     'url': 'assets/homeremedies/Ginger.jpg',
  //     "disease": "Nausea (ඔක්කාරය)",
  //     'details':
  //     'Ginger is well-known for its anti-nausea properties. Chew on a small piece of fresh ginger or drink ginger tea to help alleviate nausea symptoms. You can also take ginger supplements or ginger candies if you prefer. ',
  //     'name': 'Ginger'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Peppermint Tea.jpg',
  //     "disease": "Nausea (ඔක්කාරය)",
  //     'details':
  //     'Peppermint has a calming effect on the stomach and can help relieve nausea. Brew a cup of peppermint tea and sip it slowly to ease nausea symptoms. You can also inhale the aroma of peppermint essential oil for additional relief. ',
  //     'name': 'Peppermint Tea'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Rice Water.jpg',
  //     "disease": "Nausea (ඔක්කාරය)",
  //     'details':
  //     'Rice water is gentle on the stomach and can help alleviate nausea. Boil rice in water and strain the water. Drink this rice water slowly to help settle your stomach and ease nausea symptoms. ',
  //     'name': 'Rice Water'
  //   },
  //   {
  //     'url': 'assets/homeremedies/Lemon.jpg',
  //     "disease": "Nausea (ඔක්කාරය)",
  //     'details':
  //     'Lemon has a refreshing scent that can help alleviate nausea. Squeeze fresh lemon juice into a glass of water and drink it slowly. You can also inhale the aroma of lemon essential oil or sniff a fresh lemon to help ease nausea. ',
  //     'name': 'Lemon'
  //   },
  // ];
  //
  // Future<void> addListToFirestore() async {
  //   for (var item in imageDetails) {
  //     try {
  //       // Load the file from assets as a byte array
  //       final byteData =
  //       await rootBundle.load(item["url"] ?? "");
  //
  //       // Convert to Uint8List for upload
  //       final Uint8List fileBytes = byteData.buffer.asUint8List();
  //
  //       // Reference to Firebase Storage
  //       final storageRef = FirebaseStorage.instance.ref();
  //       final fileRef = storageRef.child(item["url"] ?? "");
  //
  //       // Upload the file
  //       var taskSnapshot = await fileRef.putData(fileBytes);
  //       var downloadURL = await fileRef.getDownloadURL();
  //       item["url"] = downloadURL;
  //       print(downloadURL);
  //       print('File uploaded successfully!');
  //       await _decoctionCollection.add(item);
  //     } catch (e) {
  //       print('Error uploading file: $e');
  //     }
  //   }
  // }

  Future<void> addDiseases(DiseasesModel disease) async {
    try {
      await _diseasesCollection.add({'diseases_name': disease.diseasesName});
      print('Disease added successfully');
    } catch (e) {
      print('Error adding disease: $e');
    }
  }

  Future<List<DiseasesModel>> getDiseases() async {
    try {
      QuerySnapshot querySnapshot = await _diseasesCollection.get();
      return querySnapshot.docs
          .map((doc) => DiseasesModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error getting disease: $e');
      return [];
    }
  }

  Future<void> updateDiseases(DiseasesModel disease) async {
    try {
      await _diseasesCollection
          .doc(disease.diseasesName)
          .update(disease.toMap());
      print('disease updated successfully');
    } catch (e) {
      print('Error updating disease: $e');
    }
  }

  Future<void> deleteDiseases(String id) async {
    try {
      await _diseasesCollection.doc(id).delete();
      print('disease deleted successfully');
    } catch (e) {
      print('Error deleting disease: $e');
    }
  }
}
