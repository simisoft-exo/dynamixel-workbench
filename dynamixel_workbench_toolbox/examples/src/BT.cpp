#include <iostream>
#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>
#include <bluetooth/hci_lib.h>
#include <unistd.h>
#include <sdbus-c++/sdbus-c++.h>
#include <tinyxml2.h>

int main(int argc, char *argv[])
{
    // Create D-Bus connection to the system bus
    auto connection = sdbus::createSystemBusConnection();


    // Create a proxy object for the BlueZ root object
    const char* serviceName = "org.bluez";
    const char* objectPath = "/org/bluez/hci0";
    auto btProxy = sdbus::createProxy(*connection, serviceName, objectPath);

    // Get the "Address" property
    std::string address;
    try {
        auto addressVariant = btProxy->getProperty("Address").onInterface("org.bluez.Adapter1");
        address = addressVariant.get<std::string>();
        std::cout << "Address: " << address << std::endl;
    } catch (const sdbus::Error& e) {
        std::cerr << "Failed to get Address property: " << e.what() << std::endl;
    }

    // Get the "Name" property
    std::string name;
    try {
        auto nameVariant = btProxy->getProperty("Name").onInterface("org.bluez.Adapter1");
        name = nameVariant.get<std::string>();
        std::cout << "Name: " << name << std::endl;
    } catch (const sdbus::Error& e) {
        std::cerr << "Failed to get Name property: " << e.what() << std::endl;
    }


    return 0;
}
