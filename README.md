# Image Processing Application in Scilab

This project is a Scilab-based image processing application, providing functionalities for contrast adjustment, filtering, and transformations on various images. It uses a modular structure for separating GUI components, image processing functions, and libraries.

## Project Structure

```plaintext
.
├── gui
│   ├── contrast.sce          # GUI logic for contrast adjustments
│   ├── filter.sce            # GUI logic for filtering options
│   ├── high_filter.sce       # GUI for high-pass filter
│   ├── home.sce              # Main home screen GUI
│   ├── low_filter.sce        # GUI for low-pass filter
│   └── transformation.sce    # GUI logic for transformations
├── images                    # Directory containing sample images
│   ├── 4.2.04.tiff
│   ├── 4.2.07.tiff
│   ├── 5.1.09.tiff
│   ├── barbara.bmp
│   ├── barbara.png
│   ├── boat.bmp
│   ├── boat.png
│   ├── fingerprint.png
│   ├── flinstones.png
│   ├── house.png
│   ├── lena.bmp
│   ├── lena.png
│   ├── mandrill.bmp
│   ├── peppers256.png
│   ├── peppers.bmp
│   └── simpson.png
├── lib                       # Library directory containing reusable functions
│   ├── constrast_func.sce     # Functions for contrast manipulation
│   ├── filter_func.sce        # Functions for image filtering
│   ├── image_processing.sce   # Core image processing utilities
│   ├── transformation_func.sce # Functions for image transformations
│   └── util.sce               # Utility functions for common tasks
└── src                       # Source code directory
    ├── main.sce              # Main entry point for the application
    └── test.sce              # Test scripts for verifying functionality


Installation

    Make sure you have Scilab installed (version 2024.1.0 or higher recommended).
    Clone this repository and navigate to the project directory.

Usage

	Run the application by executing main.sce located in the src folder. This will launch the main GUI.
    Navigate through different functionalities:
        Contrast Adjustment: Accessible via contrast.sce, where users can modify image contrast.
        Filtering: Options for applying high-pass and low-pass filters in high_filter.sce and low_filter.sce.
        Transformations: Modify image transformations, such as rotations and scaling, available in transformation.sce.

Images

The images directory contains sample images in various formats (TIFF, BMP, PNG) for testing and demonstration purposes.

Contributing

Feel free to submit issues or pull requests. Contributions that enhance the functionalities or add new image processing methods are welcome.
License

This project is open-source and available under the MIT License.



This `README.md` provides a clear overview of the project, including the directory structure, usage instructions, and contribution guidelines. Let me know if you'd like to add more specific details for any sections!
