package com.chernoivan.cloud.userconfig;

import com.iit.certificateAuthority.endUser.libraries.signJava.*;

public class EndUserSign {
    public EndUser endUser;

    public EndUserSign() throws Exception {
        initialize();
    }

    private void initialize() throws Exception {
        endUser = new EndUser();
        endUser.SetCharset("UTF-8");
        endUser.SetUIMode(false);
        endUser.Initialize();
    }

    private static boolean writeFile(String fileName, byte[] data) {
        java.io.File file = new java.io.File(fileName);

        try {
            java.io.FileOutputStream fileOutputStream = new java.io.FileOutputStream(
                    file);
            fileOutputStream.write(data);
            fileOutputStream.close();
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    // read private key
    private void readPKey() throws Exception {
        int keyMediaTypeIndex;
        int keyMediaDeviceIndex;
        String keyMediaType;
        String keyMediaDevice;
        String keyMediasPassword;

        keyMediaTypeIndex = 0;
        while (!(keyMediaType = endUser.EnumKeyMediaTypes(keyMediaTypeIndex)).equals("")) {
            EndUserUtils.printMessage(keyMediaTypeIndex + ". " + keyMediaType);

            keyMediaDeviceIndex = 0;
            while (!(keyMediaDevice = endUser.EnumKeyMediaDevices(keyMediaTypeIndex, keyMediaDeviceIndex)).equals("")) {
                EndUserUtils.printMessage("\t" + keyMediaDeviceIndex + ". " + keyMediaDevice);

                keyMediaDeviceIndex++;
            }
            keyMediaTypeIndex++;
        }

        EndUserUtils.printMessage("Enter key media type index:");
        keyMediaTypeIndex = Integer.parseInt(EndUserUtils.readMessage());
        EndUserUtils.printMessage("Enter key media device index:");
        keyMediaDeviceIndex = Integer.parseInt(EndUserUtils.readMessage());
        EndUserUtils.printMessage("Enter key media password:");
        keyMediasPassword = EndUserUtils.readMessage();

        EndUserUtils.printMessage("Reading private key...");

        endUser.ReadPrivateKeySilently(new EndUserKeyMedia(keyMediaTypeIndex,
                keyMediaDeviceIndex, keyMediasPassword));
    }
}
