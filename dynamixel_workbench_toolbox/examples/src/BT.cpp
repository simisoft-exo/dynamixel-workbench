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
    const char* objectPath = "/";
    auto bluezRootProxy = sdbus::createProxy(*connection, serviceName, objectPath);

    std::string introspectionXML;
    bluezRootProxy->callMethod("Introspect")
                   .onInterface("org.freedesktop.DBus.Introspectable")
                   .storeResultsTo(introspectionXML);

    std::cout << introspectionXML << std::endl;

    // Parse the XML to identify device object paths
    //
    tinyxml2::XMLDocument doc;
    doc.Parse(introspectionXML.c_str());


    for (auto node = doc.FirstChildElement("node"); node; node = node->NextSiblingElement("node")) {
        const char* devicePath = node->Attribute("name");
        if (devicePath && std::string(devicePath).find("/org/bluez/hci0/dev_") != std::string::npos) {
            std::cout << "Found device: " << devicePath << std::endl;

            // Create a proxy for each device
            auto deviceProxy = sdbus::createProxy(*connection, serviceName, devicePath);

            std::string deviceIntrospectionXML;
            deviceProxy->callMethod("Introspect")
                        .onInterface("org.freedesktop.DBus.Introspectable")
                        .storeResultsTo(deviceIntrospectionXML);

            // Parse the device's XML to identify GATT services and characteristics
            tinyxml2::XMLDocument deviceDoc;
            deviceDoc.Parse(deviceIntrospectionXML.c_str());

            for (auto childNode = deviceDoc.FirstChildElement("node"); childNode; childNode = childNode->NextSiblingElement("node")) {
                const char* childPath = childNode->Attribute("name");
                if (childPath) {
                    if (std::string(childPath).find("service") != std::string::npos) {
                        std::cout << "  Service: " << childPath << std::endl;
                    } else if (std::string(childPath).find("char") != std::string::npos) {
                        std::cout << "    Characteristic: " << childPath << std::endl;
                    }
                }
            }
        }
    }

    return 0;
}
