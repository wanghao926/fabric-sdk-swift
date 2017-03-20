/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: peer/proposal.proto
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

// 
// The flow to get a generic transaction approved goes as follows:
// 
// 1. client sends proposal to endorser
// ====================================
// 
// The proposal is basically a request to do something that will result on some
// action with impact on the ledger; a proposal contains a header (with some
// metadata describing it, such as the type, the identity of the invoker, the
// time, the ID of the chain, a cryptographic nonce..) and an opaque payload that
// depends on the type specified in the header. A proposal contains the following
// messages:
// 
// SignedProposal
// |\_ Signature                                    (signature on the Proposal message by the creator specified in the header)
// \_ Proposal
// |\_ Header                                   (the header for this proposal)
// \_ Payload                                  (the payload for this proposal)
// 
// 2. endorser sends proposal response back to client
// ==================================================
// 
// The proposal response contains an endorser's response to a client's proposal. A
// proposal response contains a success/error code, a response payload and a
// signature (also referred to as endorsement) over the response payload. The
// response payload contains a hash of the proposal (to securely link this
// response to the corresponding proposal) and an opaque extension field that
// depends on the type specified in the header of the corresponding proposal. A
// proposal response contains the following messages:
// 
// ProposalResponse
// |\_ Endorsement                                  (the endorser's signature over the whole response payload)
// \_ ProposalResponsePayload                      (the payload of the proposal response)
// 
// 3. client assembles endorsements into a transaction
// ===================================================
// 
// A transaction message assembles one or more proposals and corresponding
// responses into a message to be sent to orderers. After ordering, (batches of)
// transactions are delivered to committing peers for validation and final
// delivery into the ledger. A transaction contains one or more actions. Each of
// them contains a header (same as that of the proposal that requested it) and an
// opaque payload that depends on the type specified in the header.
// 
// SignedTransaction
// |\_ Signature                                    (signature on the Transaction message by the creator specified in the header)
// \_ Transaction
// \_ TransactionAction (1...n)
// |\_ Header (1)                           (the header of the proposal that requested this action)
// \_ Payload (1)                          (the payload for this action)

///   This structure is necessary to sign the proposal which contains the header
///   and the payload. Without this structure, we would have to concatenate the
///   header and the payload to verify the signature, which could be expensive
///   with large payload
///  
///   When an endorser receives a SignedProposal message, it should verify the
///   signature over the proposal bytes. This verification requires the following
///   steps:
///   1. Verification of the validity of the certificate that was used to produce
///      the signature.  The certificate will be available once proposalBytes has
///      been unmarshalled to a Proposal message, and Proposal.header has been
///      unmarshalled to a Header message. While this unmarshalling-before-verifying
///      might not be ideal, it is unavoidable because i) the signature needs to also
///      protect the signing certificate; ii) it is desirable that Header is created
///      once by the client and never changed (for the sake of accountability and
///      non-repudiation). Note also that it is actually impossible to conclusively
///      verify the validity of the certificate included in a Proposal, because the
///      proposal needs to first be endorsed and ordered with respect to certificate
///      expiration transactions. Still, it is useful to pre-filter expired
///      certificates at this stage.
///   2. Verification that the certificate is trusted (signed by a trusted CA) and
///      that it is allowed to transact with us (with respect to some ACLs);
///   3. Verification that the signature on proposalBytes is valid;
///   4. Detect replay attacks;
struct Protos_SignedProposal: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "SignedProposal"
  static let protoPackageName: String = "protos"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .unique(proto: "proposal_bytes", json: "proposalBytes"),
    2: .same(proto: "signature"),
  ]

  ///   The bytes of Proposal
  var proposalBytes: Data = Data()

  ///   Signaure over proposalBytes; this signature is to be verified against
  ///   the creator identity contained in the header of the Proposal message
  ///   marshaled as proposalBytes
  var signature: Data = Data()

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularBytesField(value: &proposalBytes)
    case 2: try decoder.decodeSingularBytesField(value: &signature)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !proposalBytes.isEmpty {
      try visitor.visitSingularBytesField(value: proposalBytes, fieldNumber: 1)
    }
    if !signature.isEmpty {
      try visitor.visitSingularBytesField(value: signature, fieldNumber: 2)
    }
  }

  func _protobuf_generated_isEqualTo(other: Protos_SignedProposal) -> Bool {
    if proposalBytes != other.proposalBytes {return false}
    if signature != other.signature {return false}
    return true
  }
}

///   A Proposal is sent to an endorser for endorsement.  The proposal contains:
///   1. A header which should be unmarshaled to a Header message.  Note that
///      Header is both the header of a Proposal and of a Transaction, in that i)
///      both headers should be unmarshaled to this message; and ii) it is used to
///      compute cryptographic hashes and signatures.  The header has fields common
///      to all proposals/transactions.  In addition it has a type field for
///      additional customization. An example of this is the ChaincodeHeaderExtension
///      message used to extend the Header for type CHAINCODE.
///   2. A payload whose type depends on the header's type field.
///   3. An extension whose type depends on the header's type field.
///  
///   Let us see an example. For type CHAINCODE (see the Header message),
///   we have the following:
///   1. The header is a Header message whose extensions field is a
///      ChaincodeHeaderExtension message.
///   2. The payload is a ChaincodeProposalPayload message.
///   3. The extension is a ChaincodeAction that might be used to ask the
///      endorsers to endorse a specific ChaincodeAction, thus emulating the
///      submitting peer model.
struct Protos_Proposal: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Proposal"
  static let protoPackageName: String = "protos"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "header"),
    2: .same(proto: "payload"),
    3: .same(proto: "extension"),
  ]

  ///   The header of the proposal. It is the bytes of the Header
  var header: Data = Data()

  ///   The payload of the proposal as defined by the type in the proposal
  ///   header.
  var payload: Data = Data()

  ///   Optional extensions to the proposal. Its content depends on the Header's
  ///   type field.  For the type CHAINCODE, it might be the bytes of a
  ///   ChaincodeAction message.
  var extension_p: Data = Data()

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularBytesField(value: &header)
    case 2: try decoder.decodeSingularBytesField(value: &payload)
    case 3: try decoder.decodeSingularBytesField(value: &extension_p)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !header.isEmpty {
      try visitor.visitSingularBytesField(value: header, fieldNumber: 1)
    }
    if !payload.isEmpty {
      try visitor.visitSingularBytesField(value: payload, fieldNumber: 2)
    }
    if !extension_p.isEmpty {
      try visitor.visitSingularBytesField(value: extension_p, fieldNumber: 3)
    }
  }

  func _protobuf_generated_isEqualTo(other: Protos_Proposal) -> Bool {
    if header != other.header {return false}
    if payload != other.payload {return false}
    if extension_p != other.extension_p {return false}
    return true
  }
}

// -------- the Chaincode Proposal -----------

// 
// The flow to get a CHAINCODE transaction approved goes as follows:
// 
// 1. client sends proposal to endorser
// ====================================
// 
// The proposal is basically a request to do something on a chaincode, that will
// result on some action - some change in the state of a chaincode and/or some
// data to be committed to the ledger; a proposal in general contains a header
// (with some metadata describing it, such as the type, the identity of the
// invoker, the time, the ID of the chain, a cryptographic nonce..) and a payload
// (the chaincode ID, invocation arguments..). Optionally, it may contain actions
// that the endorser may be asked to endorse, to emulate a submitting peer. A
// chaincode proposal contains the following messages:
// 
// SignedProposal
// |\_ Signature                                    (signature on the Proposal message by the creator specified in the header)
// \_ Proposal
// |\_ Header                                   (the header for this proposal)
// |\_ ChaincodeProposalPayload                 (the payload for this proposal)
// \_ ChaincodeAction                          (the actions for this proposal - optional for a proposal)
// 
// 2. endorser sends proposal response back to client
// ==================================================
// 
// The proposal response contains an endorser's response to a client's proposal. A
// proposal response contains a success/error code, a response payload and a
// signature (also referred to as endorsement) over the response payload. The
// response payload contains a hash of the proposal (to securely link this
// response to the corresponding proposal), a description of the action resulting
// from the proposal and the endorser's signature over its payload. Formally, a
// chaincode proposal response contains the following messages:
// 
// ProposalResponse
// |\_ Endorsement                                  (the endorser's signature over the whole response payload)
// \_ ProposalResponsePayload
// \_ ChaincodeAction                          (the actions for this proposal)
// 
// 3. client assembles endorsements into a transaction
// ===================================================
// 
// A transaction message assembles one or more proposals and corresponding
// responses into a message to be sent to orderers. After ordering, (batches of)
// transactions are delivered to committing peers for validation and final
// delivery into the ledger. A transaction contains one or more actions. Each of
// them contains a header (same as that of the proposal that requested it), a
// proposal payload (same as that of the proposal that requested it), a
// description of the resulting action and signatures from each of the endorsers
// that endorsed the action.
// 
// SignedTransaction
// |\_ Signature                                    (signature on the Transaction message by the creator specified in the header)
// \_ Transaction
// \_ TransactionAction (1...n)
// |\_ Header (1)                           (the header of the proposal that requested this action)
// \_ ChaincodeActionPayload (1)
// |\_ ChaincodeProposalPayload (1)     (payload of the proposal that requested this action)
// \_ ChaincodeEndorsedAction (1)
// |\_ Endorsement (1...n)          (endorsers' signatures over the whole response payload)
// \_ ProposalResponsePayload
// \_ ChaincodeAction          (the actions for this proposal)

///   ChaincodeHeaderExtension is the Header's extentions message to be used when
///   the Header's type is CHAINCODE.  This extensions is used to specify which
///   chaincode to invoke and what should appear on the ledger.
struct Protos_ChaincodeHeaderExtension: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ChaincodeHeaderExtension"
  static let protoPackageName: String = "protos"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .unique(proto: "payload_visibility", json: "payloadVisibility"),
    2: .unique(proto: "chaincode_id", json: "chaincodeId"),
  ]

  private class _StorageClass {
    var _payloadVisibility: Data = Data()
    var _chaincodeId: Protos_ChaincodeID? = nil

    init() {}

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._payloadVisibility = _payloadVisibility
      clone._chaincodeId = _chaincodeId
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

  ///   The PayloadVisibility field controls to what extent the Proposal's payload
  ///   (recall that for the type CHAINCODE, it is ChaincodeProposalPayload
  ///   message) field will be visible in the final transaction and in the ledger.
  ///   Ideally, it would be configurable, supporting at least 3 main visibility
  ///   modes:
  ///   1. all bytes of the payload are visible;
  ///   2. only a hash of the payload is visible;
  ///   3. nothing is visible.
  ///   Notice that the visibility function may be potentially part of the ESCC.
  ///   In that case it overrides PayloadVisibility field.  Finally notice that
  ///   this field impacts the content of ProposalResponsePayload.proposalHash.
  var payloadVisibility: Data {
    get {return _storage._payloadVisibility}
    set {_uniqueStorage()._payloadVisibility = newValue}
  }

  ///   The ID of the chaincode to target.
  var chaincodeId: Protos_ChaincodeID {
    get {return _storage._chaincodeId ?? Protos_ChaincodeID()}
    set {_uniqueStorage()._chaincodeId = newValue}
  }
  var hasChaincodeId: Bool {
    return _storage._chaincodeId != nil
  }
  mutating func clearChaincodeId() {
    return _storage._chaincodeId = nil
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
    case 1: try decoder.decodeSingularBytesField(value: &_storage._payloadVisibility)
    case 2: try decoder.decodeSingularMessageField(value: &_storage._chaincodeId)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._payloadVisibility.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._payloadVisibility, fieldNumber: 1)
      }
      if let v = _storage._chaincodeId {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
  }

  func _protobuf_generated_isEqualTo(other: Protos_ChaincodeHeaderExtension) -> Bool {
    return withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
      if _storage !== other_storage {
        if _storage._payloadVisibility != other_storage._payloadVisibility {return false}
        if _storage._chaincodeId != other_storage._chaincodeId {return false}
      }
      return true
    }
  }
}

///   ChaincodeProposalPayload is the Proposal's payload message to be used when
///   the Header's type is CHAINCODE.  It contains the arguments for this
///   invocation.
struct Protos_ChaincodeProposalPayload: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ChaincodeProposalPayload"
  static let protoPackageName: String = "protos"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "input"),
    2: .same(proto: "TransientMap"),
  ]

  ///   Input contains the arguments for this invocation. If this invocation
  ///   deploys a new chaincode, ESCC/VSCC are part of this field.
  var input: Data = Data()

  ///   TransientMap contains data (e.g. cryptographic material) that might be used
  ///   to implement some form of application-level confidentiality. The contents
  ///   of this field are supposed to always be omitted from the transaction and
  ///   excluded from the ledger.
  var transientMap: Dictionary<String,Data> = [:]

  init() {}

  mutating func _protobuf_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protobuf_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    switch fieldNumber {
    case 1: try decoder.decodeSingularBytesField(value: &input)
    case 2: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufBytes>.self, value: &transientMap)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !input.isEmpty {
      try visitor.visitSingularBytesField(value: input, fieldNumber: 1)
    }
    if !transientMap.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufBytes>.self, value: transientMap, fieldNumber: 2)
    }
  }

  func _protobuf_generated_isEqualTo(other: Protos_ChaincodeProposalPayload) -> Bool {
    if input != other.input {return false}
    if transientMap != other.transientMap {return false}
    return true
  }
}

///   ChaincodeAction contains the actions the events generated by the execution
///   of the chaincode.
struct Protos_ChaincodeAction: SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ChaincodeAction"
  static let protoPackageName: String = "protos"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "results"),
    2: .same(proto: "events"),
    3: .same(proto: "response"),
  ]

  private class _StorageClass {
    var _results: Data = Data()
    var _events: Data = Data()
    var _response: Protos_Response? = nil

    init() {}

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._results = _results
      clone._events = _events
      clone._response = _response
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

  ///   This field contains the read set and the write set produced by the
  ///   chaincode executing this invocation.
  var results: Data {
    get {return _storage._results}
    set {_uniqueStorage()._results = newValue}
  }

  ///   This field contains the events generated by the chaincode executing this
  ///   invocation.
  var events: Data {
    get {return _storage._events}
    set {_uniqueStorage()._events = newValue}
  }

  ///   This field contains the result of executing this invocation.
  var response: Protos_Response {
    get {return _storage._response ?? Protos_Response()}
    set {_uniqueStorage()._response = newValue}
  }
  var hasResponse: Bool {
    return _storage._response != nil
  }
  mutating func clearResponse() {
    return _storage._response = nil
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
    case 1: try decoder.decodeSingularBytesField(value: &_storage._results)
    case 2: try decoder.decodeSingularBytesField(value: &_storage._events)
    case 3: try decoder.decodeSingularMessageField(value: &_storage._response)
    default: break
    }
  }

  func _protobuf_generated_traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._results.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._results, fieldNumber: 1)
      }
      if !_storage._events.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._events, fieldNumber: 2)
      }
      if let v = _storage._response {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
  }

  func _protobuf_generated_isEqualTo(other: Protos_ChaincodeAction) -> Bool {
    return withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
      if _storage !== other_storage {
        if _storage._results != other_storage._results {return false}
        if _storage._events != other_storage._events {return false}
        if _storage._response != other_storage._response {return false}
      }
      return true
    }
  }
}
