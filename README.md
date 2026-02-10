# 📡 ΣΔ ADC Design using open source IIC-OSIC-TOOLS

This repository documents the development of a **Sigma–Delta (ΣΔ) Analog-to-Digital Converter (ADC)** using **IIC-OSIC-TOOLS** and the **IHP SG13G2 Open PDK**.

The project follows a **top-down mixed-signal IC design flow**:

> **Behavioral modeling → Ideal circuit implementation → Real circuit implementation (PDK) → Layout (planned)**

The modulator architecture and noise-shaping techniques implemented in this project are directly based on:
> [**R. Schreier and G. C. Temes**, *Understanding Delta-Sigma data converters*](https://ieeexplore.ieee.org/book/5264508)

# 🛠 Tool Installation & Prerequisites

To utilize the designs in this repository, you will need the following tools organized by design stage.

### 1️⃣ IC Design Environment (Docker)

We use the **IIC-OSIC-TOOLS** Docker container for schematic capture and circuit simulation. This environment comes pre-configured with:
- **[Xschem](https://xschem.sourceforge.io/):** Schematic capture
- **[ngspice](https://ngspice.sourceforge.io/):** Circuit simulator
- **[IHP SG13G2 PDK](https://github.com/IHP-GmbH/IHP-Open-PDK):** 130nm Open Source Process Design Kit

👉 **[Install the IIC-OSIC-TOOLS Docker Environment](https://github.com/iic-jku/IIC-OSIC-TOOLS)** *Follow the official instructions to install Docker and set up the container.*

### 2️⃣ Behavioral Modeling (Local Install)

The system-level modeling requires MATLAB/Simulink and the Delta-Sigma Toolbox.
- **[MATLAB & Simulink](https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html):** Follow the official guide to install products with an internet connection.
- **[Delta-Sigma Toolbox](https://www.mathworks.com/matlabcentral/fileexchange/19-delta-sigma-toolbox?s_tid=srchtitle):** Download and install this toolbox to run the noise shaping and SNR estimation scripts.

### 3️⃣ Sizing & Analysis (Local Install)

To view and run the transistor sizing notebooks (`.ipynb` files) located in `3_real_circuits/sizing/`, you will need a local installation of:
- **[Python 3.8+](https://www.python.org/)** 
- **[Jupyter Notebook](https://jupyter.org/)** (all included in docker-image of IIC-OSIC-TOOLS)

# 🧠 What this project demonstrates

This project connects **ΣΔ signal-processing theory** to **transistor-level analog design** using a completely open-source workflow:

-   **[MATLAB / Simulink](https://de.mathworks.com/help/install/ug/install-products-with-internet-connection.html)** → Behavioral modeling and noise shaping analysis
-   [**Xschem**](https://xschem.sourceforge.io/) **+ [ngspice](https://ngspice.sourceforge.io/)** → Circuit simulation
-   [**gm/ID methodology**](https://github.com/bmurmann/Book-on-gm-ID-design) → Transistor sizing (via [`pygmid`](https://github.com/dreoilin/pygmid))
-   [**SG13G2 PDK**](https://github.com/IHP-GmbH/IHP-Open-PDK) → Real 130nm BiCMOS devices


# 🗂 Repository Structure

``` text
drms-elie3/
├── 1_behavioural_model/   → MATLAB/Simulink ΣΔ models
├── 2_ideal_circuits/      → Ideal SC circuit simulations
├── 3_real_circuits/       → Transistor-level schematics
│   └── sizing/            → gm/ID notebooks (Jupyter/Python)
├── 4_layout/              → (Planned) Layout using KLayout
├── 5_report/              → Quarto report source
└── README.md
```

# 🔬 Design Flow & Completed Work

## 1️⃣ Behavioral Modeling

This section contains the system-level reference designs used to validate noise shaping, estimate SNR, and verify architecture stability before circuit implementation.

**Completed Designs:**

-   **1st-Order ΣΔ ADC:** Run `dsm_l1_plot` to simulate the first-order system.

-   **2nd-Order ΣΔ ADC:** Run `dsm_l2_plot` to simulate the second-order system.

To run these models:

```         
cd 1_behavioural_model 
# Open MATLAB/Octave and run the scripts above
```

## 2️⃣ Ideal Circuit Flow

This stage implements the modulator using ideal switched-capacitor (SC) components to bridge the gap between mathematical models and transistor circuits.

### 🚀 Simulation & Analysis Workflow

To analyze these circuits, you must first run the circuit simulation in Xschem to generate raw data, then use the provided MATLAB scripts for signal processing (Transient and FFT analysis).

**Step 1: Generate Simulation Data**
1. Open the desired schematic in **Xschem**:
   ```
   cd 2_ideal_circuits
   xschem first_order_delta_sigma_adc_single_ended.sch &
   # OR
   xschem second_order_delta_sigma_adc_single_ended.sch &
   ```
2. Click **Netlist** and then **Simulate**.
3. This process generates a `.txt` data file within the `2_ideal_circuits/simulations/` folder.

**Step 2: Post-Processing with MATLAB** Once the simulation is complete and the `.txt` file exists, run the corresponding MATLAB scripts to visualize the results:

| Modulator Order | Analysis Type       | MATLAB Script                         |
|-----------------|--------------------|---------------------------------------|
| 1st-Order       | Transient Analysis | first_order_dsm_plot_transient.m      |
| 1st-Order       | FFT Analysis       | first_order_dsm_fft.m                 |
| 2nd-Order       | Transient Analysis | second_order_dsm_plot_transient.m     |
| 2nd-Order       | FFT Analysis       | second_order_dsm_fft.m                |

> [!IMPORTANT] Ensure your MATLAB working directory is set to `2_ideal_circuits/` so that the scripts can correctly locate the data exported to the `/simulations` folder.

## 3️⃣ Transistor-Level Work

This section covers the implementation of real circuit blocks using the IHP SG13G2 PDK.

**Completed Designs:**

-   **Folded Cascode OTA:** Fully sized and tested.

-   **Testbench:** `ota_folded_cascoded_tb.sch` (Includes transient and AC analysis with ideal CMFB).

-   **Sizing Script:** Jupyter notebook using [`pygmid`](https://github.com/dreoilin/pygmid) for transistor sizing located in `3_real_circuits/sizing/sizing_ota_sizing_gmid_sg13hv_folded.ipynb`

### 🚀 Simulation & Analysis Workflow

Similar to the ideal circuit flow, the transistor-level OTA analysis follows a two-step process: circuit simulation in Xschem followed by post-processing in MATLAB.

**Step 1: Generate Simulation Data**
1. Open the OTA testbench schematic in **Xschem**:
   ```
   cd 3_real_circuits
   xschem ota_folded_cascoded_tb.sch &
   ```
2. Click **Netlist** and then **Simulate**.
3. This process generates a `.txt` data file within the `3_real_circuits/simulations/` folder.

**Step 2: Post-Processing with MATLAB**
Once the simulation is complete and the `.txt` file exists, run the MATLAB script to visualize the transient and AC analysis results:

```
cd 3_real_circuits
# Open MATLAB and run:
ota_folded_cascoded_analysis.m
```

> [!IMPORTANT] Ensure your MATLAB working directory is set to `3_real_circuits/` so that the script can correctly locate the data exported to the `/simulations` folder.

# 📚 References

This project builds upon established work in ΣΔ data converter theory, analog IC design methodologies, and open-source PDK development.  

👉 **[Full Bibliography](https://aditya-shandilya.github.io/drms-elie3/references.html)**
