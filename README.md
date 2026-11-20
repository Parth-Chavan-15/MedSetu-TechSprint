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
    <a href="https://pub.dev/packages/geolocator"><img src="https://img.shields.io/badge/Geolocator-GPS_Location-34A853?style=for-the-badge&logo=googlemaps&logoColor=white" alt="GPS Location" /></a>
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

Under the Government of India’s **Pradhan Mantri Bhartiya Janaushadhi Pariyojana (PMBJP)**, authorized Kendras provide certified generic medicines at **50% to 90% cheaper rates** than commercial brands.

Despite this nationwide initiative, millions of citizens still buy costly branded drugs out-of-pocket because the supply chain fails at the critical "last mile":

```mermaid
flowchart LR
    RX["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Doctor Prescription &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Handwritten Shorthand &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"] -->|Illegible Brand| PATIENT["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confused Patient &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unaware of Generic &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"]
    PATIENT -->|Travels to Kendra| KENDRA["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jan Aushadhi Kendra &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Empty Shelves: Ghost Stock &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"]
    PORTAL["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Central Portal &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; False 'In Stock' Status &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"] -->|Out of Sync| KENDRA
    KENDRA -->|Urgent Need| RETAIL["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Commercial Chemist &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; High Out-of-Pocket Cost &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"]

    classDef clinic fill:#E1F5FE,stroke:#0288D1,color:#01579B,stroke-width:2px;
    classDef patient fill:#FFF8E1,stroke:#FFA000,color:#E65100,stroke-width:2px;
    classDef portal fill:#ECEFF1,stroke:#607D8B,color:#263238,stroke-width:2px;
    classDef kendra fill:#FFEBEE,stroke:#E53935,color:#B71C1C,stroke-width:2px;
    classDef retail fill:#EDE7F6,stroke:#7E57C2,color:#4527A0,stroke-width:2px;

    class RX clinic;
    class PATIENT patient;
    class PORTAL portal;
    class KENDRA kendra;
    class RETAIL retail;

    linkStyle default stroke:#78909C,stroke-width:2px;
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
* **📞 One-Tap Chemist Contact**: Embedded pharmacy contact card with direct phone calling to verify stock before traveling.

---

## 🏗️ System Architecture

```mermaid
flowchart TB
    subgraph ChemistEngine["Chemist Supply Ingestion Engine"]
        direction TB
        C_INV["&nbsp;&nbsp;&nbsp;&nbsp; Distributor Paper Bill &nbsp;&nbsp;&nbsp;&nbsp;"] --> G_INV["&nbsp;&nbsp;&nbsp;&nbsp; Gemini Vision OCR &nbsp;&nbsp;&nbsp;&nbsp;"]
        C_PDF["&nbsp;&nbsp;&nbsp;&nbsp; Wholesale PDF Invoice &nbsp;&nbsp;&nbsp;&nbsp;"] --> G_PDF["&nbsp;&nbsp;&nbsp;&nbsp; Gemini PDF Parser &nbsp;&nbsp;&nbsp;&nbsp;"]
        C_VOICE["&nbsp;&nbsp;&nbsp;&nbsp; Spoken Restock Voice &nbsp;&nbsp;&nbsp;&nbsp;"] --> G_NLP["&nbsp;&nbsp;&nbsp;&nbsp; Gemini Speech NLP &nbsp;&nbsp;&nbsp;&nbsp;"]
        C_BC["&nbsp;&nbsp;&nbsp;&nbsp; Package Barcode &nbsp;&nbsp;&nbsp;&nbsp;"] --> BC_SCAN["&nbsp;&nbsp;&nbsp;&nbsp; Barcode Scanner &nbsp;&nbsp;&nbsp;&nbsp;"]

        G_INV --> IRS["&nbsp;&nbsp;&nbsp;&nbsp; Invoice Review Sheet &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Human Validation &nbsp;&nbsp;&nbsp;&nbsp;"]
        G_PDF --> IRS
        G_NLP --> IRS
        BC_SCAN -->|Atomic +1 Count| FS_INV
        IRS -->|Chemist Approval| FS_INV[(" Cloud Firestore <br/> Store Inventory ")]
    end

    subgraph CoreEngine["Real-Time Freshness and Catalog Pipeline"]
        direction TB
        FS_MED[(" Cloud Firestore <br/> Medicines Master ")]
        FS_STORES[(" Cloud Firestore <br/> Stores Directory ")]

        FS_INV -.->|Live Stock Overrides| RANK["&nbsp;&nbsp;&nbsp;&nbsp; Priority Ranking Engine &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Freshness Scoring &nbsp;&nbsp;&nbsp;&nbsp;"]
        FS_MED -.->|Salt Matching| RANK
        FS_STORES -.->|Chemist Registry| RANK
    end

    subgraph PatientEngine["Patient Demand and Discovery Engine"]
        direction TB
        P_RX["&nbsp;&nbsp;&nbsp;&nbsp; Doctor Prescription &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Camera Capture &nbsp;&nbsp;&nbsp;&nbsp;"] --> G_RX["&nbsp;&nbsp;&nbsp;&nbsp; Prescription Decoder &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Gemini Vision AI &nbsp;&nbsp;&nbsp;&nbsp;"]
        P_TXT["&nbsp;&nbsp;&nbsp;&nbsp; Manual Medicine Search &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Brand or Generic &nbsp;&nbsp;&nbsp;&nbsp;"] --> MATCH["&nbsp;&nbsp;&nbsp;&nbsp; Catalog Matcher &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Prefix Query &nbsp;&nbsp;&nbsp;&nbsp;"]
        G_RX -->|Extracted Medicines| MATCH
        MATCH -->|Resolved Generic Salt| RANK

        RANK --> UI_STORES["&nbsp;&nbsp;&nbsp;&nbsp; Nearby Store Results &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Fresh (<24h) vs Likely &nbsp;&nbsp;&nbsp;&nbsp;"]
        UI_STORES --> ACT_CARD["&nbsp;&nbsp;&nbsp;&nbsp; Pharmacist Handover &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Verification Card &nbsp;&nbsp;&nbsp;&nbsp;"]
        UI_STORES --> ACT_CALL["&nbsp;&nbsp;&nbsp;&nbsp; Direct Chemist Call &nbsp;&nbsp;&nbsp;&nbsp;"]
        UI_STORES --> ACT_INFO["&nbsp;&nbsp;&nbsp;&nbsp; Store Address & License &nbsp;&nbsp;&nbsp;&nbsp;"]
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
    class UI_STORES,ACT_CARD,ACT_CALL,ACT_INFO output;

    linkStyle default stroke:#78909C,stroke-width:2px;
```

<div align="center">
  <sub>Dual-agent architecture: supply-side rapid restocking meets demand-side prescription decoding and freshness-ranked discovery.</sub>
</div>

<br/>

<details>
<summary><b>🔍 View detailed End-to-End Sequence Workflow (click to expand)</b></summary>

<br/>

```mermaid
sequenceDiagram
    autonumber
    actor Chemist as Pharmacist
    actor Patient as Patient
    participant App as MedSetu App
    participant Gemini as Google Gemini
    participant Firestore as Cloud Firestore
    participant Phone as Phone Dialer

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

    Note over Patient, Phone: Demand Side: Prescription Decoding and Verified Routing
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
    Patient->>Phone: One-tap call chemist to confirm availability
```

</details>

---

## ⚡ Algorithmic Intelligence: Priority Ranking

To eradicate ghost stock, MedSetu calculates a dynamic **Priority Score** for each pharmacy carrying the requested medicine, prioritizing verified shelf freshness, generic availability, and affordability:

$$\text{Priority Score} = \left(100 \times \mathbf{1}_{\Delta t \lt 24\text{ h}}\right) + \left(10 \times \mathbf{1}_{\text{Generic}}\right)$$

$$\text{Tie-Breaker} = \min(\text{Unit Price})$$

### Priority Evaluation Pipeline

```mermaid
flowchart TD
    START["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Store Inventory Record &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"] --> TIER1{"&nbsp;&nbsp;&nbsp;&nbsp; Verified Today (<24h)? &nbsp;&nbsp;&nbsp;&nbsp;"}
    TIER1 -- Yes: under 24h --> S1["&nbsp;&nbsp;&nbsp;&nbsp; Tier 1: Fresh Stock &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; +100 Points Awarded &nbsp;&nbsp;&nbsp;&nbsp;"]
    TIER1 -- No: over 24h --> S0["&nbsp;&nbsp;&nbsp;&nbsp; Catalog Baseline &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; +0 Points &nbsp;&nbsp;&nbsp;&nbsp;"]

    S1 --> TIER2{"&nbsp;&nbsp;&nbsp;&nbsp; PMBJP Generic Salt? &nbsp;&nbsp;&nbsp;&nbsp;"}
    S0 --> TIER2
    TIER2 -- Yes: Generic --> G1["&nbsp;&nbsp;&nbsp;&nbsp; Tier 2: Generic Salt &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; +10 Points Awarded &nbsp;&nbsp;&nbsp;&nbsp;"]
    TIER2 -- No: Branded --> G0["&nbsp;&nbsp;&nbsp;&nbsp; Commercial Brand &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; +0 Points &nbsp;&nbsp;&nbsp;&nbsp;"]

    G1 --> EVAL["&nbsp;&nbsp;&nbsp;&nbsp; Priority Score Ranking &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Highest Score First &nbsp;&nbsp;&nbsp;&nbsp;"]
    G0 --> EVAL
    EVAL --> TIE["&nbsp;&nbsp;&nbsp;&nbsp; Price Tie-Breaker &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Lowest Unit Price First &nbsp;&nbsp;&nbsp;&nbsp;"]

    classDef eval fill:#E3F2FD,stroke:#1565C0,color:#0D47A1,stroke-width:2px;
    classDef bonus fill:#E8F5E9,stroke:#2E7D32,color:#1B5E20,stroke-width:2px;
    classDef neutral fill:#ECEFF1,stroke:#607D8B,color:#263238,stroke-width:2px;
    classDef sort fill:#FFF8E1,stroke:#FFA000,color:#E65100,stroke-width:2px;

    class TIER1,TIER2 eval;
    class S1,G1 bonus;
    class S0,G0 neutral;
    class START,EVAL,TIE sort;

    linkStyle default stroke:#78909C,stroke-width:2px;
```

| Evaluation Stage | Scoring Mechanism | Operational Impact for Patients |
| :--- | :--- | :--- |
| **Tier 1: Physical Freshness** | `+100 pts` if verified within `< 24 hours` | Guarantees zero wasted trips by prioritizing pharmacies whose shelves were restocked today. |
| **Tier 2: Generic Preference** | `+10 pts` if authorized PMBJP generic | Prioritizes government affordable generic salts over commercial branded alternatives. |
| **Tier 3: Price Tie-Breaker** | $\min(\text{Unit Price})$ | When availability and formulation match, automatically routes patients to the most economical store. |

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

### 3-Tier Medical Safety Architecture

| Safety Layer | Implementation Mechanism | Clinical & Regulatory Safeguard |
| :--- | :--- | :--- |
| **1. Mandatory Gate Modal** | First-launch acknowledgment dialog | Mandates explicit user confirmation: *"Always verify medicines with a registered Pharmacist before purchase."* |
| **2. The Pharmacist Card** | In-app counter presentation token | Hands substitution authority to licensed chemists before dispensing Schedule H/H1 drugs. |
| **3. Chemist Review Gate** | Interactive pre-commit review sheet | Prevents unverified AI vision or voice extractions from touching live database records without human sign-off. |

1. **Mandatory Launch Disclaimer**: Users must explicitly acknowledge:  
   `"Always verify medicines with a registered Pharmacist before purchase."`
2. **The Counter Handshake Card**: Before traveling, the app generates a dedicated handover token:  
   `"Hello Pharmacist, please verify if [Generic Salt] is a valid substitute for [Prescribed Brand] prescribed here."`
3. **Chemist Review Gate**: AI vision and voice extractions are never written directly to the database; they populate an interactive editable sheet requiring human validation.

---

## 🗄️ Data Architecture & Synchronization

MedSetu uses a relational document model in Cloud Firestore designed for real-time querying, high availability, and low read latency:

```mermaid
flowchart LR
    MED["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; medicines &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Master Drug Catalog &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"] ---|1 : N| INV["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; store_inventory &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Live Counts & Freshness &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"]
    STORES["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stores &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chemist Registry & GPS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"] ---|1 : N| INV

    classDef master fill:#E8EAF6,stroke:#3F51B5,color:#1A237E,stroke-width:2px;
    classDef stores fill:#E0F2F1,stroke:#00897B,color:#004D40,stroke-width:2px;
    classDef inv fill:#FFF8E1,stroke:#FF8F00,color:#E65100,stroke-width:2px;

    class MED master;
    class STORES stores;
    class INV inv;

    linkStyle default stroke:#78909C,stroke-width:2px;
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
MedSetu uses Google Gemini 2.5 Flash for prescription vision decoding, invoice OCR, and voice parsing. Add your API key in the client configuration files:

| Target File | Configuration Parameter | Purpose |
| :--- | :--- | :--- |
| `lib/backend/gemini/gemini.dart` | `_kGeminiApiKey = 'YOUR_KEY'` | Client SDK initialization for generative vision and text |
| `lib/backend/api_requests/api_calls.dart` | `'x-goog-api-key': 'YOUR_KEY'` | REST API headers for prescription, invoice, and voice pipelines |

> [!NOTE]
> Pre-configured Firebase settings (`android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist`) are already bundled in the repository for testing with the live hackathon database.

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

### 6. What Success Looks Like
When the application boots, you will see the welcome screen displaying the circular MedSetu logo and two primary options:
* **Find Medicines**: Opens the patient prescription scanner and generic medicine directory.
* **Manage Pharmacy**: Opens the chemist authentication portal and inventory restocking dashboard.

---

## 🧭 Application Navigation Flow

```mermaid
flowchart TD
    WELCOME["&nbsp;&nbsp;&nbsp;&nbsp; Welcome Screen &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Role Selection &nbsp;&nbsp;&nbsp;&nbsp;"] -->|Find Medicines| MODAL["&nbsp;&nbsp;&nbsp;&nbsp; Safety Disclaimer &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Consultation Notice &nbsp;&nbsp;&nbsp;&nbsp;"]
    WELCOME -->|Manage Pharmacy| GATE["&nbsp;&nbsp;&nbsp;&nbsp; Seller Gatekeeper &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Auth Status Check &nbsp;&nbsp;&nbsp;&nbsp;"]

    MODAL -->|Acknowledge| PS_HUB["&nbsp;&nbsp;&nbsp;&nbsp; Patient Search Hub &nbsp;&nbsp;&nbsp;&nbsp;"]
    PS_HUB -->|Camera Photo| RX_DEC["&nbsp;&nbsp;&nbsp;&nbsp; Prescription Decoder &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Gemini Vision AI &nbsp;&nbsp;&nbsp;&nbsp;"]
    PS_HUB -->|Text Search| TXT_MATCH["&nbsp;&nbsp;&nbsp;&nbsp; Medicine Catalog &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Prefix Search &nbsp;&nbsp;&nbsp;&nbsp;"]
    RX_DEC --> CHIPS["&nbsp;&nbsp;&nbsp;&nbsp; Detected Medicines &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Selection Chips &nbsp;&nbsp;&nbsp;&nbsp;"]
    TXT_MATCH --> CHIPS

    CHIPS -->|Select Medicine| RESULTS["&nbsp;&nbsp;&nbsp;&nbsp; Store Results &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Savings & Freshness &nbsp;&nbsp;&nbsp;&nbsp;"]
    RESULTS -->|Select Pharmacy| NAV["&nbsp;&nbsp;&nbsp;&nbsp; Store Navigator &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Pharmacist Card & Dial &nbsp;&nbsp;&nbsp;&nbsp;"]

    GATE -->|Unauthenticated| LOGIN["&nbsp;&nbsp;&nbsp;&nbsp; Chemist Login &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Email / Password &nbsp;&nbsp;&nbsp;&nbsp;"]
    GATE -->|No Registered Store| REG["&nbsp;&nbsp;&nbsp;&nbsp; Pharmacy Setup &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; License & GPS Location &nbsp;&nbsp;&nbsp;&nbsp;"]
    GATE -->|Store Verified| DASH["&nbsp;&nbsp;&nbsp;&nbsp; Chemist Dashboard &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Inventory Overview &nbsp;&nbsp;&nbsp;&nbsp;"]

    LOGIN --> DASH
    REG --> DASH
    DASH -->|Update Stock| SCAN["&nbsp;&nbsp;&nbsp;&nbsp; Restock Modalities &nbsp;&nbsp;&nbsp;&nbsp;"]

    SCAN -->|Invoice Photo| MOD_INV["&nbsp;&nbsp;&nbsp;&nbsp; Camera Bill OCR &nbsp;&nbsp;&nbsp;&nbsp;"]
    SCAN -->|Wholesale PDF| MOD_PDF["&nbsp;&nbsp;&nbsp;&nbsp; Invoice PDF Parser &nbsp;&nbsp;&nbsp;&nbsp;"]
    SCAN -->|Voice Input| MOD_VOICE["&nbsp;&nbsp;&nbsp;&nbsp; AI Voice Assistant &nbsp;&nbsp;&nbsp;&nbsp;"]
    SCAN -->|Barcode Scan| MOD_BC["&nbsp;&nbsp;&nbsp;&nbsp; Barcode Scanner &nbsp;&nbsp;&nbsp;&nbsp;"]

    MOD_INV --> IRS["&nbsp;&nbsp;&nbsp;&nbsp; Invoice Review Sheet &nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; Pre-Commit Validation &nbsp;&nbsp;&nbsp;&nbsp;"]
    MOD_PDF --> IRS
    MOD_VOICE --> IRS
    MOD_BC -->|Atomic +1 Count| SYNC[(" Cloud Firestore <br/> Real-Time Stock ")]
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

| Layer | Technology | Primary Role in MedSetu |
| :--- | :--- | :--- |
| **Core Framework** | Flutter 3.x (Dart 3.x) | Cross-platform client architecture targeting Android, iOS, and Web |
| **UI & State Engine** | FlutterFlow, Provider, Google Fonts, Flutter Animate | Reactive UI components, state lifecycle management, and micro-interactions |
| **AI & Multimodal Vision** | Google Gemini 2.5 Flash (`google_generative_ai`) | Prescription vision OCR, wholesale invoice parsing, and voice NLP |
| **Backend & Cloud Database** | Google Cloud Firestore, Firebase Storage | Low-latency document storage, real-time sync, and asset persistence |
| **Authentication** | Firebase Auth | Role-gated chemist authentication and secure user sessions |
| **Hardware & Scanning** | `flutter_barcode_scanner`, `image_picker`, `file_picker` | Blister pack barcode reading, camera document captures, and PDF ingestion |
| **Geo & Communication** | `geolocator`, `url_launcher` | Chemist GPS coordinate capture, phone dialer integration, and external launching |

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
