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

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _1: SwiftProtobuf.ProtobufAPIVersion_1 {}
  typealias Version = _1
}

///   MSPConfig collects all the configuration information for
///   an MSP. The Config field should be unmarshalled in a way
///   that depends on the Type
struct Msp_MSPConfig: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "MSPConfig"
  static let protoPackageName: String = "msp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "config"),
  ]

  ///   Type holds the type of the MSP; the default one would
  ///   be of type FABRIC implementing an X.509 based provider
  var type: Int32 = 0

  ///   Config is MSP dependent configuration info
  var config: Data = Data()

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularInt32Field(value: &type)
    case 2: try decoder.decodeSingularBytesField(value: &config)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if type != 0 {
      try visitor.visitSingularInt32Field(value: type, fieldNumber: 1)
    }
    if !config.isEmpty {
      try visitor.visitSingularBytesField(value: config, fieldNumber: 2)
    }
  }

  func _protobuf_generated_isEqualTo(other: Msp_MSPConfig) -> Bool {
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
struct Msp_FabricMSPConfig: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "FabricMSPConfig"
  static let protoPackageName: String = "msp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .unique(proto: "root_certs", json: "rootCerts"),
    3: .unique(proto: "intermediate_certs", json: "intermediateCerts"),
    4: .same(proto: "admins"),
    5: .unique(proto: "revocation_list", json: "revocationList"),
    6: .unique(proto: "signing_identity", json: "signingIdentity"),
    7: .unique(proto: "organizational_unit_identifiers", json: "organizationalUnitIdentifiers"),
  ]

  private class _StorageClass {
    var _name: String = ""
    var _rootCerts: [Data] = []
    var _intermediateCerts: [Data] = []
    var _admins: [Data] = []
    var _revocationList: [Data] = []
    var _signingIdentity: Msp_SigningIdentityInfo? = nil
    var _organizationalUnitIdentifiers: [Msp_FabricOUIdentifier] = []

    init() {}

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._name = _name
      clone._rootCerts = _rootCerts
      clone._intermediateCerts = _intermediateCerts
      clone._admins = _admins
      clone._revocationList = _revocationList
      clone._signingIdentity = _signingIdentity
      clone._organizationalUnitIdentifiers = _organizationalUnitIdentifiers
      return clone
    }
  }

  private var _storage = _StorageClass()

  private mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _storage.copy()
    }
    return _storage
  }

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
  var hasSigningIdentity: Bool {
    return _storage._signingIdentity != nil
  }
  mutating func clearSigningIdentity() {
    return _storage._signingIdentity = nil
  }

  ///   OrganizationalUnitIdentifiers holds one or more
  ///   fabric organizational unit identifiers that belong to
  ///   this MSP configuration
  var organizationalUnitIdentifiers: [Msp_FabricOUIdentifier] {
    get {return _storage._organizationalUnitIdentifiers}
    set {_uniqueStorage()._organizationalUnitIdentifiers = newValue}
  }

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
      }
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularStringField(value: &_storage._name)
    case 2: try decoder.decodeRepeatedBytesField(value: &_storage._rootCerts)
    case 3: try decoder.decodeRepeatedBytesField(value: &_storage._intermediateCerts)
    case 4: try decoder.decodeRepeatedBytesField(value: &_storage._admins)
    case 5: try decoder.decodeRepeatedBytesField(value: &_storage._revocationList)
    case 6: try decoder.decodeSingularMessageField(value: &_storage._signingIdentity)
    case 7: try decoder.decodeRepeatedMessageField(value: &_storage._organizationalUnitIdentifiers)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 1)
      }
      if !_storage._rootCerts.isEmpty {
        try visitor.visitRepeatedBytesField(value: _storage._rootCerts, fieldNumber: 2)
      }
      if !_storage._intermediateCerts.isEmpty {
        try visitor.visitRepeatedBytesField(value: _storage._intermediateCerts, fieldNumber: 3)
      }
      if !_storage._admins.isEmpty {
        try visitor.visitRepeatedBytesField(value: _storage._admins, fieldNumber: 4)
      }
      if !_storage._revocationList.isEmpty {
        try visitor.visitRepeatedBytesField(value: _storage._revocationList, fieldNumber: 5)
      }
      if let v = _storage._signingIdentity {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if !_storage._organizationalUnitIdentifiers.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._organizationalUnitIdentifiers, fieldNumber: 7)
      }
    }
  }

  func _protobuf_generated_isEqualTo(other: Msp_FabricMSPConfig) -> Bool {
    return withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
      if _storage !== other_storage {
        if _storage._name != other_storage._name {return false}
        if _storage._rootCerts != other_storage._rootCerts {return false}
        if _storage._intermediateCerts != other_storage._intermediateCerts {return false}
        if _storage._admins != other_storage._admins {return false}
        if _storage._revocationList != other_storage._revocationList {return false}
        if _storage._signingIdentity != other_storage._signingIdentity {return false}
        if _storage._organizationalUnitIdentifiers != other_storage._organizationalUnitIdentifiers {return false}
      }
      return true
    }
  }
}

///   SigningIdentityInfo represents the configuration information
///   related to the signing identity the peer is to use for generating
///   endorsements
struct Msp_SigningIdentityInfo: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "SigningIdentityInfo"
  static let protoPackageName: String = "msp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .unique(proto: "public_signer", json: "publicSigner"),
    2: .unique(proto: "private_signer", json: "privateSigner"),
  ]

  private class _StorageClass {
    var _publicSigner: Data = Data()
    var _privateSigner: Msp_KeyInfo? = nil

    init() {}

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._publicSigner = _publicSigner
      clone._privateSigner = _privateSigner
      return clone
    }
  }

  private var _storage = _StorageClass()

  private mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _storage.copy()
    }
    return _storage
  }

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
  var hasPrivateSigner: Bool {
    return _storage._privateSigner != nil
  }
  mutating func clearPrivateSigner() {
    return _storage._privateSigner = nil
  }

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
      }
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularBytesField(value: &_storage._publicSigner)
    case 2: try decoder.decodeSingularMessageField(value: &_storage._privateSigner)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._publicSigner.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._publicSigner, fieldNumber: 1)
      }
      if let v = _storage._privateSigner {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
  }

  func _protobuf_generated_isEqualTo(other: Msp_SigningIdentityInfo) -> Bool {
    return withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
      if _storage !== other_storage {
        if _storage._publicSigner != other_storage._publicSigner {return false}
        if _storage._privateSigner != other_storage._privateSigner {return false}
      }
      return true
    }
  }
}

///   KeyInfo represents a (secret) key that is either already stored
///   in the bccsp/keystore or key material to be imported to the
///   bccsp key-store. In later versions it may contain also a
///   keystore identifier
struct Msp_KeyInfo: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "KeyInfo"
  static let protoPackageName: String = "msp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .unique(proto: "key_identifier", json: "keyIdentifier"),
    2: .unique(proto: "key_material", json: "keyMaterial"),
  ]

  ///   Identifier of the key inside the default keystore; this for
  ///   the case of Software BCCSP as well as the HSM BCCSP would be
  ///   the SKI of the key
  var keyIdentifier: String = ""

  ///   KeyMaterial (optional) for the key to be imported; this is
  ///   properly encoded key bytes, prefixed by the type of the key
  var keyMaterial: Data = Data()

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularStringField(value: &keyIdentifier)
    case 2: try decoder.decodeSingularBytesField(value: &keyMaterial)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !keyIdentifier.isEmpty {
      try visitor.visitSingularStringField(value: keyIdentifier, fieldNumber: 1)
    }
    if !keyMaterial.isEmpty {
      try visitor.visitSingularBytesField(value: keyMaterial, fieldNumber: 2)
    }
  }

  func _protobuf_generated_isEqualTo(other: Msp_KeyInfo) -> Bool {
    if keyIdentifier != other.keyIdentifier {return false}
    if keyMaterial != other.keyMaterial {return false}
    return true
  }
}

///   FabricOUIdentifier represents an organizazional unit and
///   its related chain of trust identifier.
struct Msp_FabricOUIdentifier: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "FabricOUIdentifier"
  static let protoPackageName: String = "msp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .unique(proto: "certifiers_identifier", json: "certifiersIdentifier"),
    2: .unique(proto: "organizational_unit_identifier", json: "organizationalUnitIdentifier"),
  ]

  ///   CertifiersIdentifier is the hash of certificates chain of trust
  ///   related to this organizational unit
  var certifiersIdentifier: Data = Data()

  ///   OrganizationUnitIdentifier defines the organizational unit under the
  ///   MSP identified with MSPIdentifier
  var organizationalUnitIdentifier: String = ""

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularBytesField(value: &certifiersIdentifier)
    case 2: try decoder.decodeSingularStringField(value: &organizationalUnitIdentifier)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !certifiersIdentifier.isEmpty {
      try visitor.visitSingularBytesField(value: certifiersIdentifier, fieldNumber: 1)
    }
    if !organizationalUnitIdentifier.isEmpty {
      try visitor.visitSingularStringField(value: organizationalUnitIdentifier, fieldNumber: 2)
    }
  }

  func _protobuf_generated_isEqualTo(other: Msp_FabricOUIdentifier) -> Bool {
    if certifiersIdentifier != other.certifiersIdentifier {return false}
    if organizationalUnitIdentifier != other.organizationalUnitIdentifier {return false}
    return true
  }
}
