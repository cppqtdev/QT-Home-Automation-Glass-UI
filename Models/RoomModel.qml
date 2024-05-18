import QtQuick 2.15

ListModel {
    ListElement {
        label: 'Home'
        icon: '\uf015'
        size: 24
        temperature: 26
        humidity: 47
        heating: 35
        water: 231
        lightIntensity: 45
    }

    ListElement {
        label: 'Living'
        icon: '\uf4b8'
        size: 24
        temperature: 26
        humidity: 47
        heating: 35
        water: 231
        lightIntensity: 45
    }

    ListElement {
        label: 'Kitchen'
        icon: '\uf79a'
        size: 20
        temperature: 32
        humidity: 67
        heating: 22
        water: 344
        lightIntensity: 78
    }

    ListElement {
        label: 'Bedroom'
        icon: '\uf236'
        size: 24
        temperature: 24
        humidity: 40
        heating: 40
        water: 304
        lightIntensity: 25
    }

    ListElement {
        label: 'Settings'
        icon: '\uf013'
        size: 20
        temperature: 28
        humidity: 77
        heating: 56
        water: 430
        lightIntensity: 85
    }
}
