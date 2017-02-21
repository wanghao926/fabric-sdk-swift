/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: msp/identity.proto
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


///   This struct represents an Identity
///   (with its MSP identifier) to be used
///   to serialize it and deserialize it
struct Msp_SerializedIdentity: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Msp_SerializedIdentity"}
  public var protoMessageName: String {return "SerializedIdentity"}
  public var protoPackageName: String {return "msp"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "Mspid", swift: "mspid"),
    2: .same(proto: "IdBytes", swift: "idBytes"),
  ]


  ///   The identifier of the associated membership service provider
  var mspid: String = ""

  ///   the Identity, serialized according to the rules of its MPS
  var idBytes: Data = Data()

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: &mspid)
    case 2: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &idBytes)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if mspid != "" {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: mspid, fieldNumber: 1)
    }
    if idBytes != Data() {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: idBytes, fieldNumber: 2)
    }
  }

  public func _protoc_generated_isEqualTo(other: Msp_SerializedIdentity) -> Bool {
    if mspid != other.mspid {return false}
    if idBytes != other.idBytes {return false}
    return true
  }
}
