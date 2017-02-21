/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: msp/mspconfig.proto
 *
 */

// 
// Copyright IBM Corp. 2016 All Rights Reserved.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf


///   MSPConfig collects all the configuration information for
///   an MSP. The Config field should be unmarshalled in a way
///   that depends on the Type
struct Msp_MSPConfig: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Msp_MSPConfig"}
  public var protoMessageName: String {return "MSPConfig"}
  public var protoPackageName: String {return "msp"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "type", swift: "type"),
    2: .same(proto: "config", swift: "config"),
  ]


  ///   Type holds the type of the MSP; the default one would
  ///   be of type FABRIC implementing an X.509 based provider
  var type: Int32 = 0

  ///   Config is MSP dependent configuration info
  var config: Data = Data()

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufInt32.self, value: &type)
    case 2: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &config)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if type != 0 {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufInt32.self, value: type, fieldNumber: 1)
    }
    if config != Data() {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: config, fieldNumber: 2)
    }
  }

  public func _protoc_generated_isEqualTo(other: Msp_MSPConfig) -> Bool {
    if type != other.type {return false}
    if config != other.config {return false}
    return true
  }
}

///   FabricMSPConfig collects all the configuration information for
///   a Fabric MSP.
///   Here we assume a default certificate validation policy, where
///   any certificate signed by any of the listed rootCA certs would
///   be considered as valid under this MSP.
///   This MSP may or may not come with a signing identity. If it does,
///   it can also issue signing identities. If it does not, it can only
///   be used to validate and verify certificates.
struct Msp_FabricMSPConfig: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Msp_FabricMSPConfig"}
  public var protoMessageName: String {return "FabricMSPConfig"}
  public var protoPackageName: String {return "msp"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "name", swift: "name"),
    2: .unique(proto: "root_certs", json: "rootCerts", swift: "rootCerts"),
    3: .unique(proto: "intermediate_certs", json: "intermediateCerts", swift: "intermediateCerts"),
    4: .same(proto: "admins", swift: "admins"),
    5: .unique(proto: "revocation_list", json: "revocationList", swift: "revocationList"),
    6: .unique(proto: "signing_identity", json: "signingIdentity", swift: "signingIdentity"),
  ]

  private class _StorageClass {
    typealias ExtendedMessage = Msp_FabricMSPConfig
    var _name: String = ""
    var _rootCerts: [Data] = []
    var _intermediateCerts: [Data] = []
    var _admins: [Data] = []
    var _revocationList: [Data] = []
    var _signingIdentity: Msp_SigningIdentityInfo? = nil

    init() {}

    func decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
      switch protoFieldNumber {
      case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: &_name)
      case 2: try setter.decodeRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &_rootCerts)
      case 3: try setter.decodeRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &_intermediateCerts)
      case 4: try setter.decodeRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &_admins)
      case 5: try setter.decodeRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &_revocationList)
      case 6: try setter.decodeSingularMessageField(fieldType: Msp_SigningIdentityInfo.self, value: &_signingIdentity)
      default: break
      }
    }

    func traverse(visitor: SwiftProtobuf.Visitor) throws {
      if _name != "" {
        try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: _name, fieldNumber: 1)
      }
      if !_rootCerts.isEmpty {
        try visitor.visitRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: _rootCerts, fieldNumber: 2)
      }
      if !_intermediateCerts.isEmpty {
        try visitor.visitRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: _intermediateCerts, fieldNumber: 3)
      }
      if !_admins.isEmpty {
        try visitor.visitRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: _admins, fieldNumber: 4)
      }
      if !_revocationList.isEmpty {
        try visitor.visitRepeatedField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: _revocationList, fieldNumber: 5)
      }
      if let v = _signingIdentity {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
    }

    func isEqualTo(other: _StorageClass) -> Bool {
      if _name != other._name {return false}
      if _rootCerts != other._rootCerts {return false}
      if _intermediateCerts != other._intermediateCerts {return false}
      if _admins != other._admins {return false}
      if _revocationList != other._revocationList {return false}
      if _signingIdentity != other._signingIdentity {return false}
      return true
    }

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._name = _name
      clone._rootCerts = _rootCerts
      clone._intermediateCerts = _intermediateCerts
      clone._admins = _admins
      clone._revocationList = _revocationList
      clone._signingIdentity = _signingIdentity
      return clone
    }
  }

  private var _storage = _StorageClass()


  ///   Name holds the identifier of the MSP; MSP identifier
  ///   is chosen by the application that governs this MSP.
  ///   For example, and assuming the default implementation of MSP,
  ///   that is X.509-based and considers a single Issuer,
  ///   this can refer to the Subject OU field or the Issuer OU field.
  var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  ///   List of root certificates trusted by this MSP
  ///   they are used upon certificate validation (see
  ///   comment for IntermediateCerts below)
  var rootCerts: [Data] {
    get {return _storage._rootCerts}
    set {_uniqueStorage()._rootCerts = newValue}
  }

  ///   List of intermediate certificates trusted by this MSP;
  ///   they are used upon certificate validation as follows:
  ///   validation attempts to build a path from the certificate
  ///   to be validated (which is at one end of the path) and
  ///   one of the certs in the RootCerts field (which is at
  ///   the other end of the path). If the path is longer than
  ///   2, certificates in the middle are searched within the
  ///   IntermediateCerts pool
  var intermediateCerts: [Data] {
    get {return _storage._intermediateCerts}
    set {_uniqueStorage()._intermediateCerts = newValue}
  }

  ///   Identity denoting the administrator of this MSP
  var admins: [Data] {
    get {return _storage._admins}
    set {_uniqueStorage()._admins = newValue}
  }

  ///   Identity revocation list
  var revocationList: [Data] {
    get {return _storage._revocationList}
    set {_uniqueStorage()._revocationList = newValue}
  }

  ///   SigningIdentity holds information on the signing identity
  ///   this peer is to use, and which is to be imported by the
  ///   MSP defined before
  var signingIdentity: Msp_SigningIdentityInfo {
    get {return _storage._signingIdentity ?? Msp_SigningIdentityInfo()}
    set {_uniqueStorage()._signingIdentity = newValue}
  }
  public var hasSigningIdentity: Bool {
    return _storage._signingIdentity != nil
  }
  public mutating func clearSigningIdentity() {
    return _storage._signingIdentity = nil
  }

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    try _uniqueStorage().decodeField(setter: &setter, protoFieldNumber: protoFieldNumber)
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    try _storage.traverse(visitor: visitor)
  }

  public func _protoc_generated_isEqualTo(other: Msp_FabricMSPConfig) -> Bool {
    return _storage === other._storage || _storage.isEqualTo(other: other._storage)
  }

  private mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _storage.copy()
    }
    return _storage
  }
}

///   SigningIdentityInfo represents the configuration information
///   related to the signing identity the peer is to use for generating
///   endorsements
struct Msp_SigningIdentityInfo: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Msp_SigningIdentityInfo"}
  public var protoMessageName: String {return "SigningIdentityInfo"}
  public var protoPackageName: String {return "msp"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .unique(proto: "public_signer", json: "publicSigner", swift: "publicSigner"),
    2: .unique(proto: "private_signer", json: "privateSigner", swift: "privateSigner"),
  ]

  private class _StorageClass {
    typealias ExtendedMessage = Msp_SigningIdentityInfo
    var _publicSigner: Data = Data()
    var _privateSigner: Msp_KeyInfo? = nil

    init() {}

    func decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
      switch protoFieldNumber {
      case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &_publicSigner)
      case 2: try setter.decodeSingularMessageField(fieldType: Msp_KeyInfo.self, value: &_privateSigner)
      default: break
      }
    }

    func traverse(visitor: SwiftProtobuf.Visitor) throws {
      if _publicSigner != Data() {
        try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: _publicSigner, fieldNumber: 1)
      }
      if let v = _privateSigner {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }

    func isEqualTo(other: _StorageClass) -> Bool {
      if _publicSigner != other._publicSigner {return false}
      if _privateSigner != other._privateSigner {return false}
      return true
    }

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._publicSigner = _publicSigner
      clone._privateSigner = _privateSigner
      return clone
    }
  }

  private var _storage = _StorageClass()


  ///   PublicSigner carries the public information of the signing
  ///   identity. For an X.509 provider this would be represented by
  ///   an X.509 certificate
  var publicSigner: Data {
    get {return _storage._publicSigner}
    set {_uniqueStorage()._publicSigner = newValue}
  }

  ///   PrivateSigner denotes a reference to the private key of the
  ///   peer's signing identity
  var privateSigner: Msp_KeyInfo {
    get {return _storage._privateSigner ?? Msp_KeyInfo()}
    set {_uniqueStorage()._privateSigner = newValue}
  }
  public var hasPrivateSigner: Bool {
    return _storage._privateSigner != nil
  }
  public mutating func clearPrivateSigner() {
    return _storage._privateSigner = nil
  }

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    try _uniqueStorage().decodeField(setter: &setter, protoFieldNumber: protoFieldNumber)
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    try _storage.traverse(visitor: visitor)
  }

  public func _protoc_generated_isEqualTo(other: Msp_SigningIdentityInfo) -> Bool {
    return _storage === other._storage || _storage.isEqualTo(other: other._storage)
  }

  private mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _storage.copy()
    }
    return _storage
  }
}

///   KeyInfo represents a (secret) key that is either already stored
///   in the bccsp/keystore or key material to be imported to the
///   bccsp key-store. In later versions it may contain also a
///   keystore identifier
struct Msp_KeyInfo: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Msp_KeyInfo"}
  public var protoMessageName: String {return "KeyInfo"}
  public var protoPackageName: String {return "msp"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .unique(proto: "key_identifier", json: "keyIdentifier", swift: "keyIdentifier"),
    2: .unique(proto: "key_material", json: "keyMaterial", swift: "keyMaterial"),
  ]


  ///   Identifier of the key inside the default keystore; this for
  ///   the case of Software BCCSP as well as the HSM BCCSP would be
  ///   the SKI of the key
  var keyIdentifier: String = ""

  ///   KeyMaterial (optional) for the key to be imported; this is
  ///   properly encoded key bytes, prefixed by the type of the key
  var keyMaterial: Data = Data()

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: &keyIdentifier)
    case 2: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &keyMaterial)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if keyIdentifier != "" {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: keyIdentifier, fieldNumber: 1)
    }
    if keyMaterial != Data() {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: keyMaterial, fieldNumber: 2)
    }
  }

  public func _protoc_generated_isEqualTo(other: Msp_KeyInfo) -> Bool {
    if keyIdentifier != other.keyIdentifier {return false}
    if keyMaterial != other.keyMaterial {return false}
    return true
  }
}
