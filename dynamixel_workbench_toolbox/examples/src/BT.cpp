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
    const char* adapterPath = "/org/bluez/hci0";
    auto adapterProxy = sdbus::createProxy(*connection, serviceName, adapterPath);

    const char* managerPath = "/";
    auto managerProxy = sdbus::createProxy(*connection, serviceName, managerPath);

    std::string introspectionXML;
    adapterProxy->callMethod("Introspect")
                   .onInterface("org.freedesktop.DBus.Introspectable")
                   .storeResultsTo(introspectionXML);

    // std::cout << introspectionXML << std::endl;
    // Get the "Address" property
    std::string address;
    try {
        auto addressVariant = adapterProxy->getProperty("Address").onInterface("org.bluez.Adapter1");
        address = addressVariant.get<std::string>();
        std::cout << "Address: " << address << std::endl;
    } catch (const sdbus::Error& e) {
        std::cerr << "Failed to get Address property: " << e.what() << std::endl;
    }

    // Get the "Name" property
    std::string name;
    try {
        auto nameVariant = adapterProxy->getProperty("Name").onInterface("org.bluez.Adapter1");
        name = nameVariant.get<std::string>();
        std::cout << "Name: " << name << std::endl;
    } catch (const sdbus::Error& e) {
        std::cerr << "Failed to get Name property: " << e.what() << std::endl;
    }
    try {

        std::map<sdbus::ObjectPath, std::map<std::string, std::map<std::string, sdbus::Variant>>> managedObjects;
        managerProxy->callMethod("GetManagedObjects").onInterface("org.freedesktop.DBus.ObjectManager").storeResultsTo(managedObjects);

        for (const auto& [objectPath, interfaces] : managedObjects) {
            std::cout << "Object: " << objectPath << std::endl;
            for (const auto& [interfaceName, properties] : interfaces) {
                std::cout << "  Interface: " << interfaceName << std::endl;
                for (const auto& [propertyName, value] : properties) {
                    std::cout << "    Property: " << propertyName << std::endl;
                }
            }
        }
    }
    catch (const sdbus::Error& error) {
        std::cerr << "D-Bus error: " << error.getName() << " - " << error.getMessage() << std::endl;
    }
    catch (const std::exception& e) {
        std::cerr << "An error occurred: " << e.what() << std::endl;
    }

    return 0;
}
