<div align="center">

  <img src="assets/images/WhatsApp_Image_2026-01-14_at_20.38.53.jpeg" alt="MedSetu Logo" width="130" style="border-radius: 50%; box-shadow: 0 8px 24px rgba(0,0,0,0.18);" />

  # 💊 MedSetu (मेडसेतु)
  ### *Bridging doctor handwriting, affordable generic medicines, and verified pharmacy inventory.*

  **Built for the GDG VESIT TechSprint Hackathon**  
  **Crafted by [Parth Chavan](https://github.com/Parth-Chavan-15)**

  <p align="center">
    <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" /></a>
    <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" /></a>
    <a href="https://ai.google.dev"><img src="https://img.shields.io/badge/Google_Gemini-2.5_Flash-8E75B2?style=for-the-badge&logo=google&logoColor=white" alt="Google Gemini" /></a>
    <a href="https://firebase.google.com"><img src="https://img.shields.io/badge/Firebase-Firestore_%26_Auth-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase" /></a>
    <a href="https://developers.google.com/maps"><img src="https://img.shields.io/badge/Google_Maps-Geo_Routing-4285F4?style=for-the-badge&logo=googlemaps&logoColor=white" alt="Google Maps" /></a>
  </p>

  <p align="center">
    <strong>MedSetu (मेडसेतु)</strong> is a dual-agent healthcare platform engineered to make affordable life-saving medicines accessible to every citizen under India's <i>Pradhan Mantri Bhartiya Janaushadhi Pariyojana (PMBJP)</i>. It couples <b>rapid, zero-friction inventory logging</b> for local chemists (via distributor bill OCR, wholesale PDFs, voice dictation, and barcode scans) with a <b>visual prescription AI decoder</b>, <b>bio-equivalent generic substitution engine</b>, and <b>same-day shelf freshness verification</b> for patients.
  </p>

  <p align="center">
    <a href="#-the-problem-the-ghost-stock-reality">The Problem</a> •
    <a href="#-the-medsetu-dual-agent-solution">The Solution</a> •
    <a href="#-key-capabilities">Key Capabilities</a> •
    <a href="#-system-architecture">Architecture</a> •
    <a href="#-algorithmic-intelligence-priority-ranking">Ranking Engine</a> •
    <a href="#-medical-liability--safety-protocols">Safety Protocols</a> •
    <a href="#-data-architecture--synchronization">Data Model</a> •
    <a href="#-quick-start">Quick Start</a> •
    <a href="#-application-navigation-flow">Navigation Flow</a>
  </p>

</div>

---

## 🚨 The Problem: The "Ghost Stock" Reality

Healthcare expenses push an estimated 55 million Indian citizens into poverty each year. To combat this crisis, the Government of India established the **Pradhan Mantri Bhartiya Janaushadhi Pariyojana (PMBJP)**, opening thousands of special Kendras that dispense certified generic medicines at **50% to 90% cheaper rates** than commercial brands.

Despite this nationwide initiative, millions of families still buy expensive branded drugs out-of-pocket because the supply chain fails at the critical "last mile":

```mermaid
flowchart LR
    RX["Doctor Prescription<br/>Handwritten Shorthand"] -->|Illegible Brand Name| PATIENT["Patient<br/>Unaware of Generic Salt"]
    PATIENT -->|Travels Miles to Kendra| STORE["Jan Aushadhi Kendra<br/>Empty Shelves: Ghost Stock"]
    DB["Central Government Portal<br/>Falsely Reports In Stock"] -->|Out of Sync with Reality| STORE
    STORE -->|Desperation Purchase| RETAIL["Commercial Chemist<br/>Full Out-of-Pocket Expense"]

    classDef redNode fill:#FFEBEE,stroke:#D32F2F,color:#B71C1C,stroke-width:2px;
    classDef warnNode fill:#FFF3E0,stroke:#F57C00,color:#E65100,stroke-width:2px;

    class RX,DB,STORE,RETAIL redNode;
    class PATIENT warnNode;

    linkStyle default stroke:#E57373,stroke-width:2px;
```

1. **The "Ghost Stock" Paradox**: Government directories assume local pharmacies carry catalog items. In reality, independent pharmacists are overwhelmed by counter sales and lack the time or tools for cumbersome manual database entry into legacy desktop ERPs. Physical shelves run dry, while central portals continue reporting false availability.
2. **The Handwriting & Brand Shorthand Barrier**: Prescriptions are written in hurried doctor shorthand using commercial brand names (such as *Augmentin 625*, *Dolo 650*, or *Pan-D*). Patients have no accessible way to decode these into active generic chemical formulations (such as *Amoxicillin + Clavulanic Acid* or *Paracetamol 650mg*).
3. **Wasted Journeys & Desperation Purchases**: Patients travel miles across town to a Jan Aushadhi Kendra, only to find the medicine out of stock. In urgent medical distress, they walk into a nearby retail chemist and pay full market price out-of-pocket.

---

## 💡 The MedSetu Dual-Agent Solution

MedSetu replaces passive, out-of-date directories with an **AI-driven real-time supply and demand ecosystem**:

| Operational Challenge | Traditional System | MedSetu Dual-Agent Ecosystem |
| :--- | :--- | :--- |
| **Inventory Logging** | Tedious manual typing into legacy desktop software (rarely performed). | **Multimodal Zero-Click Ingestion**: Ingest stock in seconds via distributor bill photos, wholesale PDFs, voice dictation, and barcode scans. |
| **Prescription Decoding** | Patients struggle to read physician handwriting and brand shorthand. | **Multimodal Vision AI**: Gemini Vision extracts medicine names directly from prescription photos and filters out dosage notes. |
| **Stock Accuracy** | Unverified catalog assumptions ("Ghost Stock"). | **Two-Tier Freshness Engine**: Clearly separates 🟢 **Verified Fresh Stock (<24h)** from 🟡 **Likely Available (≥24h)**. |
| **Price Transparency** | Patients remain unaware of low-cost generic equivalents. | **Smart Price Savings Engine**: Automatic mapping to bio-equivalent generic salts with direct side-by-side cost comparisons in ₹. |
| **Dispensing Safety** | Unregulated app suggestions create liability and safety risks. | **3-Tier Medical Safety Matrix**: Mandatory launch disclaimer, human-in-the-loop review, and an in-app counter **Pharmacist Handover Card**. |

---

## ✨ Key Capabilities

### 🏪 1. The Chemist Agent (Zero-Friction Supply Ingestion)
Engineered for busy local pharmacists and Jan Aushadhi Kendra operators who cannot spend hours typing data.

* **📸 Distributor Paper Bill OCR**: Snap a quick photo of a wholesale paper invoice. Google Gemini Vision extracts medicine names and quantities into structured data in seconds.
* **📄 Wholesale PDF Ingestion**: Directly upload digital distributor invoice PDFs to parse multi-item wholesale deliveries in a single tap without manual typing.
* **🎙️ Voice-to-Ledger Dictation**: Tap the microphone and speak naturally (e.g., *"Received 50 strips of Metformin 500mg and 20 bottles of Cetirizine"*). The NLP engine parses quantities and automatically corrects Indian pharmaceutical phonetic spellings.
* **📦 Blister Pack Barcode Restocking**: Integrated camera barcode scanner reads medicine cartons and blister packs, performing atomic quantity increments in Cloud Firestore with instant haptic feedback.
* **🧑‍💻 Human-in-the-Loop Review Sheet**: Prevents AI extraction inaccuracies from touching production inventory. Chemists review, adjust quantities, and remove items on an interactive bottom sheet before confirming updates.

---

### 🧑‍🦳 2. The Patient Agent (Intelligent Demand & Safe Discovery)
Engineered for citizens, elderly patients, and caregivers seeking reliable, affordable medicines.

* **👁️ Handwritten Prescription Decoder**: Upload a photo of a doctor's prescription. Gemini Vision OCR identifies brand and generic medications while filtering out handwriting artifacts, frequencies, and dosage noise.
* **🔄 Automatic Generic Substitution & Price Comparison**: Cross-references prescribed commercial brands with bio-equivalent Jan Aushadhi generic salts, displaying transparent cost savings in ₹.
* **🟢 Real-Time Shelf Freshness Verification**:
  * 🟢 **Verified Fresh Stock (<24h)**: Stock verified on shelves today via distributor bill OCR, PDF, voice, or barcode. Zero ghost-stock risk.
  * 🟡 **Likely Available (≥24h)**: Baseline catalog listing without same-day chemist confirmation. Patients are encouraged to call ahead.
* **🤝 The Pharmacist Card (Liability Shield)**: An in-app handover screen designed for counter presentation to licensed chemists:
  > *"Hello Pharmacist, please verify if [Generic Salt] is a valid substitute for [Prescribed Brand] prescribed here."*
* **🗺️ One-Tap Navigation & Direct Calling**: Embedded pharmacy contact card with direct phone calling and native Google Maps navigation.

---

## 🏗️ System Architecture

```mermaid
flowchart TB
    subgraph ChemistEngine["Chemist Supply Ingestion Engine"]
        direction TB
        C_INV["Distributor Paper Bill"] --> G_INV["Gemini Vision OCR"]
        C_PDF["Wholesale PDF Invoice"] --> G_PDF["Gemini PDF Parser"]
        C_VOICE["Spoken Restock Speech"] --> G_NLP["Gemini Speech NLP"]
        C_BC["Carton Blister Barcode"] --> BC_SCAN["Hardware Barcode Scanner"]

        G_INV --> IRS["Invoice Review Sheet<br/>Human-in-the-Loop"]
        G_PDF --> IRS
        G_NLP --> IRS
        BC_SCAN -->|Atomic Plus One Update| FS_INV
        IRS -->|Chemist Approval| FS_INV[("Cloud Firestore<br/>Store Inventory")]
    end

    subgraph CoreEngine["Real-Time Freshness and Catalog Pipeline"]
        direction TB
        FS_MED[("Cloud Firestore<br/>Medicines Master")]
        FS_STORES[("Cloud Firestore<br/>Stores Directory")]

        FS_INV -.->|Live Stock Overrides| RANK["Priority Ranking Engine<br/>Freshness Scoring"]
        FS_MED -.->|Salt Matching| RANK
        FS_STORES -.->|Location Coordinates| RANK
    end

    subgraph PatientEngine["Patient Demand and Discovery Engine"]
        direction TB
        P_RX["Doctor Prescription Photo"] --> G_RX["Gemini Prescription Decoder"]
        P_TXT["Manual Salt or Brand Search"] --> MATCH["Fuzzy Prefix Matcher"]
        G_RX -->|Extracted Medicine List| MATCH
        MATCH -->|Resolved Salt References| RANK

        RANK --> UI_STORES["Nearby Store Results<br/>Verified under 24h vs Likely"]
        UI_STORES --> ACT_CARD["Pharmacist Handover Card"]
        UI_STORES --> ACT_CALL["One-Tap Phone Call"]
        UI_STORES --> ACT_MAP["Google Maps Navigation"]
    end

    classDef chemist fill:#E8F5E9,stroke:#2E7D32,color:#1B5E20,stroke-width:2px;
    classDef patient fill:#E3F2FD,stroke:#1565C0,color:#0D47A1,stroke-width:2px;
    classDef ai fill:#F3E5F5,stroke:#7B1FA2,color:#4A148C,stroke-width:2px;
    classDef firestore fill:#FFF8E1,stroke:#F57F17,color:#E65100,stroke-width:2px;
    classDef output fill:#E0F2F1,stroke:#00796B,color:#004D40,stroke-width:2px;

    class C_INV,C_PDF,C_VOICE,C_BC,BC_SCAN,IRS chemist;
    class P_RX,P_TXT,MATCH patient;
    class G_INV,G_PDF,G_NLP,G_RX ai;
    class FS_INV,FS_MED,FS_STORES,RANK firestore;
    class UI_STORES,ACT_CARD,ACT_CALL,ACT_MAP output;

    linkStyle default stroke:#78909C,stroke-width:2px;
```

<div align="center">
  <sub>Dual-agent architecture: supply-side rapid restocking meets demand-side prescription decoding and freshness-ranked discovery.</sub>
</div>

<details>
<summary><b>🔍 View detailed End-to-End Sequence Workflow (click to expand)</b></summary>

```mermaid
sequenceDiagram
    autonumber
    actor Chemist as Pharmacist
    actor Patient as Patient
    participant App as MedSetu App
    participant Gemini as Google Gemini
    participant Firestore as Cloud Firestore
    participant Maps as Phone or Maps

    Note over Chemist, Firestore: Supply Side: Rapid Multimodal Inventory Ingestion
    alt Invoice Photo or Wholesale PDF
        Chemist->>App: Captures paper bill photo or uploads digital PDF
        App->>Gemini: Sends document with JSON extraction schema
        Gemini-->>App: Returns structured medicine and quantity list
        App->>Chemist: Displays interactive Invoice Review Sheet
        Chemist->>App: Edits or approves quantities
        App->>Firestore: Writes verified inventory with server timestamp
    else Voice Dictation
        Chemist->>App: Speaks restock details into AI Voice Assistant
        App->>Gemini: Extracts entities with phonetic spelling correction
        Gemini-->>App: Returns structured medicine items
        App->>Chemist: Stages items in review sheet for validation
    else Barcode Restocking
        Chemist->>App: Scans blister pack or carton barcode
        App->>Firestore: Looks up medicine by package barcode
        Firestore-->>App: Returns matched medicine reference
        App->>Firestore: Executes atomic plus-one stock increment
    end

    Note over Patient, Maps: Demand Side: Prescription Decoding and Verified Routing
    Patient->>App: Uploads handwritten doctor prescription
    App->>Gemini: Analyzes image and filters non-drug text
    Gemini-->>App: Returns clean list of medicine names
    App->>Firestore: Queries master catalog for generic salt equivalents
    Firestore-->>App: Returns bio-equivalent generic records
    App->>Firestore: Queries inventory across nearby pharmacies
    App->>App: Scores and ranks stores by freshness and unit price
    App-->>Patient: Displays prioritized stores with cost savings
    Patient->>App: Selects verified pharmacy
    App->>Patient: Displays Pharmacist Card for counter verification
    Patient->>Maps: One-tap call chemist or launch Google Maps navigation
```

</details>

---

## ⚡ Algorithmic Intelligence: Priority Ranking

To eradicate ghost stock, MedSetu calculates a dynamic **Priority Score** for each pharmacy carrying the requested medicine, prioritizing verified shelf freshness, generic availability, and affordability:

$$\text{Priority Score} = \left(100 \times \mathbf{1}_{\Delta t \lt 24\text{ h}}\right) + \left(10 \times \mathbf{1}_{\text{Generic}}\right)$$

$$\text{Tie-Breaker} = \min(\text{Unit Price})$$

* **Freshness Tier (+100 pts)**: Awarded if the inventory was restocked or verified within the last 24 hours ($\Delta t \lt 24\text{ h}$), guaranteeing that the patient will not encounter empty shelves.
* **Generic Priority (+10 pts)**: Awarded to authorized PMBJP Kendras and generic formulations to promote low-cost healthcare.
* **Unit Price Tie-Breaker**: When priority scores are identical, stores are ranked by lowest unit price first.

```dart
List<StoreInventoryRecord> sortInventoryByPriority(List<StoreInventoryRecord> inputList) {
  final now = DateTime.now();

  inputList.sort((a, b) {
    // 1. Determine Freshness (< 24 hours)
    final DateTime aTime = a.lastUpdated ?? DateTime(1970);
    final DateTime bTime = b.lastUpdated ?? DateTime(1970);
    final bool aFresh = now.difference(aTime).inHours < 24;
    final bool bFresh = now.difference(bTime).inHours < 24;

    // 2. Generic Preference
    final bool aGeneric = a.isGeneric == true;
    final bool bGeneric = b.isGeneric == true;

    // Safely parse unit prices
    final double aPrice = (a.unitPrice ?? 999999).toDouble();
    final double bPrice = (b.unitPrice ?? 999999).toDouble();

    int scoreA = 0;
    int scoreB = 0;

    // Freshness Tier (< 24 hours): +100 pts
    if (aFresh) scoreA += 100;
    if (bFresh) scoreB += 100;

    // Generic Priority: +10 pts
    if (aGeneric) scoreA += 10;
    if (bGeneric) scoreB += 10;

    // Highest score first
    if (scoreA != scoreB) {
      return scoreB.compareTo(scoreA);
    }

    // Tie-Breaker: Lowest Unit Price First
    return aPrice.compareTo(bPrice);
  });

  return inputList;
}
```

### Real-Time Availability Indicators

| Indicator | Status Tier | Verification Window | Operational Meaning |
| :---: | :--- | :--- | :--- |
| `🟢` | **Verified Fresh Stock** | Updated within `< 24 hours` | Physical shelf stock confirmed today via invoice OCR, wholesale PDF, voice, or barcode. Zero ghost-stock risk. |
| `🟡` | **Likely Available** | Updated `≥ 24 hours` or catalog default | Expected baseline catalog listing without same-day restock confirmation. Patients are advised to call before visiting. |

---

## 🛡️ Medical Liability & Safety Protocols

> [!IMPORTANT]
> **MedSetu is an informational bridge, not a prescribing authority.**  
> Under Indian drug regulations (Drugs and Cosmetics Act), Schedule H and H1 medications must be verified and dispensed by a licensed pharmacist.

MedSetu implements a **3-Tier Medical Safety Matrix**:

```
┌──────────────────────────────────────────────────────────────────────────┐
│                       3-TIER MEDICAL SAFETY MATRIX                       │
├───────────────────────────┬──────────────────────────────────────────────┤
│ 1. Mandatory Gate Modal   │ Explicit user disclaimer on first launch     │
│                           │ acknowledging pharmacist confirmation.       │
├───────────────────────────┼──────────────────────────────────────────────┤
│ 2. The Pharmacist Card    │ In-app counter token presenting substitute   │
│                           │ generic salt for licensed pharmacist check.  │
├───────────────────────────┼──────────────────────────────────────────────┤
│ 3. Human-in-the-Loop OCR  │ Prevents raw AI vision extraction from       │
│                           │ corrupting stock without chemist sign-off.    │
└───────────────────────────┴──────────────────────────────────────────────┘
```

1. **Mandatory Launch Disclaimer**: Users must explicitly acknowledge:  
   `"Always verify medicines with a registered Pharmacist before purchase."`
2. **The Counter Handshake Card**: Before traveling, the app generates a dedicated handover token:  
   `"Hello Pharmacist, please verify if [Generic Salt] is a valid substitute for [Prescribed Brand] prescribed here."`
3. **Chemist Review Gate**: AI vision and voice extractions are never written directly to the database; they populate an interactive editable sheet requiring human validation.

---

## 🗄️ Data Architecture & Synchronization

MedSetu uses a relational document model in Cloud Firestore designed for real-time querying, high availability, and low read latency:

```
┌──────────────────────┐          ┌──────────────────────┐
│  medicines (Master)  │          │   stores (Registry)  │
│  • Brand & Salt Name │          │  • Chemist Location  │
│  • Standard MRP      │          │  • License & Contact │
└──────────┬───────────┘          └──────────┬───────────┘
           │ 1                               │ 1
           │                                 │
           │           N           N         │
           └───────────► ┌─────────────────┐ ◄┘
                         │ store_inventory │
                         │ • Live Quantity │
                         │ • Selling Price │
                         │ • Freshness Time│
                         └─────────────────┘
```

| Collection | Core Responsibility | Key Relational Pointers | Real-Time Sync Triggers |
| :--- | :--- | :--- | :--- |
| **`medicines`** | Master drug directory mapping commercial brands to active generic chemical salts, package barcodes, and standard MRPs. | `generic_source_ref` &rarr; parent generic salt | Administrative master catalog updates |
| **`stores`** | Verified pharmacy registry storing chemist credentials, state drug licenses, contact numbers, and geographic coordinates. | `owner_uid` &rarr; authenticated chemist UID | Store registration and profile management |
| **`store_inventory`** | Real-time shelf inventory linking physical pharmacies to medicines, tracking live quantities, unit prices, and status. | `store_ref` &rarr; `stores`<br/>`medicine_id` &rarr; `medicines` | Distributor bill OCR, PDF bills, voice dictation, barcode restock |
| **`users`** | Authentication and profile registry for patients and pharmacists. | `uid` &rarr; Firebase Auth UID | User sign-up and authentication lifecycle |

### Security & Access Rules
* **Public Read Access**: The `medicines`, `stores`, and `store_inventory` collections permit open read access so patients can search for medicines and check availability without mandatory account registration.
* **Protected Write Access**: Modifying inventory records and store profiles strictly requires active Firebase Authentication tied to the pharmacy's verified owner UID.

---

## 🚦 Quick Start

Follow these steps to run MedSetu on your development machine or mobile device.

### 1. Prerequisites
Ensure you have the following installed on your system:
* **Flutter SDK**: `3.x` (Dart SDK `>= 3.0.0 < 4.0.0` from [flutter.dev](https://docs.flutter.dev/get-started/install))
* **Android Studio**: With Android SDK 35 installed (or Xcode if running on macOS for iOS)
* **Google AI Studio API Key**: A free Gemini API key from [aistudio.google.com](https://aistudio.google.com/)

### 2. Clone the Repository
```bash
git clone https://github.com/Parth-Chavan-15/MedSetu-TechSprint.git
cd MedSetu-TechSprint
```

### 3. Install Packages
Install all Flutter and Dart package dependencies:
```bash
flutter pub get
```

### 4. Configure Google Gemini API Key
MedSetu uses Google Gemini 2.5 Flash for prescription vision decoding, invoice OCR, and voice parsing. Add your Gemini API key in the following two files:
* In `lib/backend/gemini/gemini.dart` (set `_kGeminiApiKey`):
  ```dart
  const _kGeminiApiKey = 'YOUR_GEMINI_API_KEY_HERE';
  ```
* In `lib/backend/api_requests/api_calls.dart` (replace the `x-goog-api-key` header value with your key).

> [!NOTE]
> Pre-configured Firebase settings (`android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist`) are already included in the repository for testing with the live hackathon database.

### 5. Launch the Application
```bash
# Clean cached build artifacts
flutter clean
flutter pub get

# Launch on connected Android emulator or physical device
flutter run

# Or launch on Google Chrome
flutter run -d chrome
```

> [!TIP]
> **Simulating Location on Android Emulators**:  
> To test proximity routing with seed stores, open Android Emulator Extended Controls (`...`) &rarr; **Location** &rarr; set Latitude: `19.0760`, Longitude: `72.8777` (Mumbai) &rarr; Click **Save/Send**.

### 6. What Success Looks Like
When the application boots, you will see the welcome screen displaying the circular MedSetu logo and two primary options:
* **Find Medicines**: Opens the patient prescription scanner and generic medicine directory.
* **Manage Pharmacy**: Opens the chemist authentication portal and inventory restocking dashboard.

---

## 🧭 Application Navigation Flow

```mermaid
flowchart TD
    WELCOME["MedSetu Welcome Screen<br/>Role Selection Gate"] -->|Tap Find Medicines| MODAL["Medical Safety Disclaimer<br/>Mandatory Consultation Acknowledgment"]
    WELCOME -->|Tap Manage Pharmacy| GATE["Seller Gate<br/>Authentication Check"]

    MODAL -->|Confirm Disclaimer| PS_HUB["Patient Search Hub"]
    PS_HUB -->|Camera Capture| RX_DEC["Gemini Prescription Decoder"]
    PS_HUB -->|Keyword Input| TXT_MATCH["Medicine Catalog Search"]
    RX_DEC --> CHIPS["Identified Medicine Selection"]
    TXT_MATCH --> CHIPS

    CHIPS -->|Select Medicine| RESULTS["Store Results Screen<br/>Smart Savings Alert and Freshness Indicators"]
    RESULTS -->|Select Store| NAV["Store Navigator Hub<br/>Pharmacist Card, Dialer, and Maps"]

    GATE -->|Unauthenticated| LOGIN["Seller Login and Registration"]
    GATE -->|Authenticated Without Store| REG["New Pharmacy Registration<br/>License, Address, Contact, and Location"]
    GATE -->|Authenticated With Store| DASH["Seller Dashboard<br/>Sales Metrics, Low Stock, and Inventory"]

    LOGIN --> DASH
    REG --> DASH
    DASH -->|Update Stock Action| SCAN["Seller Restock Hub"]

    SCAN -->|1. Invoice Photo| MOD_INV["Camera Bill OCR"]
    SCAN -->|2. Wholesale PDF| MOD_PDF["Wholesale PDF Parser"]
    SCAN -->|3. Voice Mode| MOD_VOICE["AI Voice Assistant"]
    SCAN -->|4. Barcode Scan| MOD_BC["Hardware Barcode Scanner"]

    MOD_INV --> IRS["Invoice Review Sheet<br/>Human-in-the-Loop Validation"]
    MOD_PDF --> IRS
    MOD_VOICE --> IRS
    MOD_BC -->|Direct Increment| SYNC[("Cloud Firestore<br/>Real-Time Inventory Sync")]
    IRS -->|Chemist Approval| SYNC

    classDef welcome fill:#ECEFF1,stroke:#455A64,color:#263238,stroke-width:2px;
    classDef patient fill:#E3F2FD,stroke:#1565C0,color:#0D47A1,stroke-width:2px;
    classDef chemist fill:#E8F5E9,stroke:#2E7D32,color:#1B5E20,stroke-width:2px;
    classDef ai fill:#F3E5F5,stroke:#7B1FA2,color:#4A148C,stroke-width:2px;
    classDef sync fill:#FFF8E1,stroke:#F57F17,color:#E65100,stroke-width:2px;

    class WELCOME,MODAL welcome;
    class PS_HUB,CHIPS,RESULTS,NAV,TXT_MATCH patient;
    class GATE,LOGIN,REG,DASH,SCAN,IRS chemist;
    class RX_DEC,MOD_INV,MOD_PDF,MOD_VOICE,MOD_BC ai;
    class SYNC sync;

    linkStyle default stroke:#78909C,stroke-width:2px;
```

---

## 🛠️ Tech Stack & Dependencies

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           MEDSETU TECH STACK                            │
├───────────────────────┬─────────────────────────────────────────────────┤
│ Core Framework        │ Flutter 3.x (Dart 3.x)                          │
├───────────────────────┼─────────────────────────────────────────────────┤
│ UI & State Engine     │ FlutterFlow, Provider, Google Fonts,            │
│                       │ Flutter Animate                                 │
├───────────────────────┼─────────────────────────────────────────────────┤
│ AI & Multimodal Vision│ Google Gemini 2.5 Flash API                     │
│                       │ (google_generative_ai, custom REST pipelines)   │
├───────────────────────┼─────────────────────────────────────────────────┤
│ Backend & Database    │ Google Cloud Firestore, Firebase Storage        │
├───────────────────────┼─────────────────────────────────────────────────┤
│ Authentication        │ Firebase Auth (Email/Password, Phone OTP)       │
├───────────────────────┼─────────────────────────────────────────────────┤
│ Hardware & Scanning   │ flutter_barcode_scanner, image_picker,          │
│                       │ file_picker (wholesale PDF bills)               │
├───────────────────────┼─────────────────────────────────────────────────┤
│ Geo & Communication   │ geolocator, Google Maps API, url_launcher       │
└───────────────────────┴─────────────────────────────────────────────────┘
```

---

## 📁 Project Structure

```text
MedSetu-TechSprint/
├── android/                 # Android native project and Gradle configuration (SDK 35)
├── ios/                     # iOS native workspace and Podfile
├── assets/                  # Fonts and brand imagery
│   └── images/              # Official MedSetu logo (WhatsApp_Image_2026-01-14_at_20.38.53.jpeg)
├── firebase/                # Cloud Firestore rules, security indexes, and Cloud Functions
│   ├── firestore.rules      # Firestore collection security rules
│   └── functions/           # Node.js Firebase functions
├── lib/                     # Application source code
│   ├── authentication_pages/# Seller login, gatekeeper check, and shop registration
│   ├── backend/             # Firebase configuration, Firestore schema, and Gemini API calls
│   │   ├── api_requests/    # AnalyzePrescription, AnalyzeInvoice, AnalyzeText calls
│   │   ├── gemini/          # Google Generative AI client
│   │   └── schema/          # Firestore record wrappers (medicines, stores, inventory, users)
│   ├── custom_code/         # Custom actions (convertImageToBase64, convertNamesToRefs)
│   ├── flutter_flow/        # Theme definitions, navigation router, and custom functions
│   │   ├── custom_functions.dart # Priority ranking and status color logic
│   │   └── nav/             # GoRouter route declarations
│   ├── home_page/           # Welcome screen and dual-role selector
│   ├── patient_pages/       # Prescription scanner, store results, and store navigator
│   ├── seller_pages/        # Restock modalities, invoice review sheet, and barcode scanner
│   └── main.dart            # Application entry point and router initialization
└── pubspec.yaml             # Dart environment and Flutter package dependencies
```

---

## 🏆 Project Context

* **Event**: GDG VESIT TechSprint Hackathon
* **Domain**: Healthcare Accessibility, Multimodal AI, and Public Health Logistics
* **Mission**: Eliminating out-of-pocket medical expenditure by bringing real-time data transparency to India's *Pradhan Mantri Bhartiya Janaushadhi Pariyojana (PMBJP)*.

---

## 👨‍💻 Author

**Parth Chavan**
* GitHub: [@Parth-Chavan-15](https://github.com/Parth-Chavan-15)
* Repository: [MedSetu-TechSprint](https://github.com/Parth-Chavan-15/MedSetu-TechSprint)

---

<div align="center">
  <sub>Built with ❤️ by Parth Chavan to make affordable healthcare a reality for every Indian citizen. 🇮🇳</sub>
</div>
